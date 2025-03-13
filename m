Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5883A60B0A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 09:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8A210E999;
	Fri, 14 Mar 2025 08:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dell.com header.i=@dell.com header.b="KmG50+MF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 12596 seconds by postgrey-1.36 at gabe;
 Thu, 13 Mar 2025 20:04:33 UTC
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522F710E074;
 Thu, 13 Mar 2025 20:04:30 +0000 (UTC)
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DFpmxA018559;
 Thu, 13 Mar 2025 12:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=smtpout1; bh=h
 Ljub6PoD3/IHa+flUhTkrbH6y3HLdm6Ln4miE+NA34=; b=KmG50+MF9wkbYQnea
 Z9J5Ea6ZgP78VoTS9tX3Ei/3JSEk16RyW04iDFAfoVg7gX6h4JV/ZYWbYExDxvqb
 nEK0W26PRYU1d7uxf5DnhN9RrdkHMy+bOO/EQcYvSe1pFVnSW2AVfriDO0QKWbVo
 e4m3S0SpCss+FlW1Shc+6frdebQa0IYh+rGMpJnWGk8QNgU4VlyDhmADgf7nAwYq
 2sN89hgFEShj58efhFfLJbX/jI1PEhk7qJaLWhuJmp86a+4v1Y/XNsO0Id+jdJdV
 86xY8zcs4QLNLYqSRQHHaY1FvC452N5CWMqkACyS1CwMDoO1e06swIWKimRkwLDe
 pdPhQ==
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com (PPS) with ESMTPS id 45au44jcwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Mar 2025 12:34:20 -0400 (EDT)
Received: from pps.filterd (m0142693.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DFbEMQ028129;
 Thu, 13 Mar 2025 12:34:19 -0400
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
 by mx0a-00154901.pphosted.com (PPS) with ESMTPS id 45c25j0xbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Mar 2025 12:34:18 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4ogS7GC68ApMXfwqkctvQxks/9wVcoQYNuE5Nl3Y3d+QVXnpx4OecBnXgTCoON6OZtcbDVri3QYZfPKBNpFUdLE48PoKsiTtqMmGnFfR8oL8BpqOzyzd7zHuSErrxNIDZcmTUdKf/hAi3yO8zVBMX03J9kxoyQV9+fwoYWVSTAxBBrf8KH9sb4GffzUM6a06PXnKOqzNyYRf/nvThy1EDlr7kPTOesfL1WTKR+Q6jN3z6OqHcbU+finw0KO9a0K4bvoOb16bx8RGq398X0rSC+hwPCwBML6MhG6CHQHgjwQ7ZbVjNO2vks5nCqTnMXB8amZOq9cYq9lsJ/m+RFQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLjub6PoD3/IHa+flUhTkrbH6y3HLdm6Ln4miE+NA34=;
 b=a69IsIY/2xlwhQACZfNhQ2BMSYgRYGh8duc3HVfnfME2zpC9VA6joVA+LSEagcT9dPlioYTOjNweFT3jVgbT+pxMFDAxHfp509ms+6IVsZP3nkVod/vEmEvBrBeY0YY0x4Cf9CroDyPjSyogbEwkis3aulLoOE3oKhxcqK9560xDHFYNbGKRc0I99d2was4DjO6UW5I2elcLwL73bIzpqyOJFgnXoewtGxMOOYrstyfmHsOFQ/NihR8YW/EQ547y0SnlNlEAe0UG2W3FzqB/elBWBrd/20DLUT/kWM6nGpi8zoE4oKuHszVj6lGQgUsiWbS+HJmfPUq4LBS9TVpNjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from CY5PR19MB6147.namprd19.prod.outlook.com (2603:10b6:930:c::14)
 by DM6PR19MB4106.namprd19.prod.outlook.com (2603:10b6:5:24e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 16:34:14 +0000
Received: from CY5PR19MB6147.namprd19.prod.outlook.com
 ([fe80::d390:13bd:b078:f743]) by CY5PR19MB6147.namprd19.prod.outlook.com
 ([fe80::d390:13bd:b078:f743%7]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 16:34:14 +0000
From: "Tudor, Laurentiu" <Laurentiu.Tudor1@dell.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, "abel.vesa@linaro.org" <abel.vesa@linaro.org>,
 "johan@kernel.org" <johan@kernel.org>
Subject: RE: [PATCH v2 0/2] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
Thread-Topic: [PATCH v2 0/2] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
Thread-Index: AQHbkt8aD0iZ7dHIsUSDlD3K/YJUJ7NxROqg
Date: Thu, 13 Mar 2025 16:34:14 +0000
Message-ID: <CY5PR19MB6147B4E21D67D2E2A1913E6FBAD32@CY5PR19MB6147.namprd19.prod.outlook.com>
References: <20250311234109.136510-1-alex.vinarskis@gmail.com>
In-Reply-To: <20250311234109.136510-1-alex.vinarskis@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_ActionId=dde3064c-cb63-4bf2-8ff7-9ab61fd45b6c;
 MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_ContentBits=0;
 MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Enabled=true;
 MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Method=Privileged;
 MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Name=Public
 No Visual Label;
 MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_SetDate=2025-03-13T16:34:00Z;
 MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Tag=10, 0, 1, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR19MB6147:EE_|DM6PR19MB4106:EE_
x-ms-office365-filtering-correlation-id: b6aee14b-6694-4983-5938-08dd624ce43f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|7416014|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ySJ+kgjjYNZvzT6l5Q4dKJv5AjzuEHRMz1A5cycGIjdxyHvLMVYYswHV4P3P?=
 =?us-ascii?Q?NH00DOa+SlnO78cE8H3aEToO6VTk4+n8qVGuoXjs80ZcA25otJE1Hd4neNBw?=
 =?us-ascii?Q?vIMceLxNmokJ1zUjkUvQ9ByUhgc/JCuZq6m/t8jEwjlJdHzww2csdgHkbQDw?=
 =?us-ascii?Q?QvlS4NzyvWgGj3TE2ATv8WYEAnry/pzZVM068FWwyQ1gxkR3UFPi9kG9A9sk?=
 =?us-ascii?Q?BwllRuk3mgfzXP1tsk25pcS8lYY0NE7op9aEIH+BD0pVwDZpDSLfbGHquIqp?=
 =?us-ascii?Q?vxYVDJfvUag7LBlK4f+D9Cdq00mFN8EBIZvwg02DP6plwqxC39OhVuNr95iM?=
 =?us-ascii?Q?XA0YfAg+l1Pe1Bn0XrKhumnNcHKT5Zq1fEzTdwKa36WWz0oj/uKVyvC6L+i9?=
 =?us-ascii?Q?hW6YvgMXSjubP58GNp9H6EtabYreqNJ93pJGQQJi/3VQUzZXOO8hVBc31wrZ?=
 =?us-ascii?Q?8E6VYnoshgPFliltHpbokvaBYB9iK/4VItdzOTmO9ynjYMZs7Sh/Aez4xDnr?=
 =?us-ascii?Q?aziGOXQly2/Ssn/Z0+9NemardZEaj5lzjl/L7IVzf2aejeUUWSLXf2eAe4Q5?=
 =?us-ascii?Q?EbdU6aWHeXBiwyPwSWfmTu8yR8VEDzfWzKBUjZ3HjO8u1gj7pXkJfGz8F9II?=
 =?us-ascii?Q?9BYryRL40fRWC0Bt39ZaQpc9nLT/V8U9TAyIU8aXlHtST36IkmRwuu4Dq1AK?=
 =?us-ascii?Q?TSDffglKW9bLtMa04mhFj40xKTA+JekAU0Rc4aGtCBZySu2eaBkd8f5RIZFv?=
 =?us-ascii?Q?xOLzf0+Bojg1nS6u0jq3A6W+TO2o+JsYggRfAD4KGfoXoA5pGWWoSwdzAkRa?=
 =?us-ascii?Q?+jpag0e1ar6LLtJqNWr0d98iDDKNrDWyCkOTz9KH1MUY1JkSzrgq0V4Y3bvO?=
 =?us-ascii?Q?FYlbdl+Q3+C7AtxLvDlzo+Zo0QaSJ4UNEJBFm0nc60u0Sv3DlB9IojiLZNJf?=
 =?us-ascii?Q?fb0/RjFxKfUWcrK8Dkl2UhRuyUa7VFdpQGgA7BWrxKZIOjlt6i8LG6Ek09uR?=
 =?us-ascii?Q?H1rtKrm9K2ntogb07wlFczZA/YnQ+N3TQKr6xheWL3lS8siJ4C4WRQ6OA5bW?=
 =?us-ascii?Q?l5VhngxWU4s+lJb3QhZutooxB1Id+q83jZxtdjiznrhfjcyRKd41KVKZQ6va?=
 =?us-ascii?Q?AGpXZ828QlzMwLdhXhEDI1jBZkmqKUm1X5UOP/mS4zxlX6BebA/RIQCmhIen?=
 =?us-ascii?Q?1SPqg+ExBya+Y1Jjw55QMXUKzDKP3Cx6W2LTY57rqXDhMzX9Isbc1U/oYwP5?=
 =?us-ascii?Q?PI7L1hnk1CaMuodIons6E8Nc16eDCQtRlTyy3EdrkKtMzkpjxspQEZKnG4Ou?=
 =?us-ascii?Q?e7LxX1K3S5Ax0r0BxwX7L/hpASPo8AhU0rqlBoxQP7gxSC4H56FRTq/9Hfp3?=
 =?us-ascii?Q?yV/sL3K6h9/cqvjS8CjuJxGli9xR3Da2ZkG1r2rxzMOvXQsdGg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR19MB6147.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(7416014)(1800799024)(376014)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qvGFCLBdj9CIbW5vBbN1Lz2fPadLyRnqYXlkMbtZrMTEtAuKJenMh3p028i4?=
 =?us-ascii?Q?G1T/MiOTrZbQMz762G63fZi5ixRZA1yvWcThp/26B7gbLgQ213HsSdYvteSJ?=
 =?us-ascii?Q?mXd6M4DHLGcBtwjRQU6uQVWfhXQHLyIG+vXUapnn82vc282vlXlf958Buln1?=
 =?us-ascii?Q?wBKMmFrlzDWPf1FaDThk14flbB6S544idPMePLulds57ICXAxHYKn8U77v1v?=
 =?us-ascii?Q?H1fh27FOccaqTUEbzBPeBtvBdKVLOrZhx2GjkYdzMABz7Ar2ffHnDRP+uPl4?=
 =?us-ascii?Q?pO1X2aOhDVtl5z/v0twbdElhy4R+oLDm7fnyRhEXfKYjwWOe7iIAPa1KoQsY?=
 =?us-ascii?Q?ztUFyMehQLXF1HTi+kCo+nsZJM5W4VXZF/Y7BUru3XnZwU5s0A2O3n1vNdmQ?=
 =?us-ascii?Q?7Ludp67MNm/5/OnCJCQtBByFzHucnwD92QAMUWuANso1dwDzC2drZYfD2bHu?=
 =?us-ascii?Q?d1Hmni/ilHFVMsM3WIppv+t8KkcOEBatNzA6bXnH50O/ILeOEoBtDGsHCYHH?=
 =?us-ascii?Q?R2ToyaXmLODV2HZnjntohs6fSPgFPKcMa2mpXqQ5tmMAKYr2hsZBgOCUyi3N?=
 =?us-ascii?Q?ps7kvsHJf/ESJV2p0AUGc0H/v6D/GEnWoqCnBldpD346Z84YqX4ZE4FtlnW9?=
 =?us-ascii?Q?e5p3sXIuW3mf9ikn9ohaf+Fuh3TLrtUkk07U22SWui+661aBx3qFgxzXMqEY?=
 =?us-ascii?Q?iU/MP13JK9wh+Rxxj+oZ3UEs1LMD3yrS2eXCeCcyM5WmkxBOjzynd8wqKHwP?=
 =?us-ascii?Q?bRqfj5ywrxt+llHUFwi3rU2JxJnqfd6wA1rWhwfEJi6IVUwVcUrNeNQgFWIb?=
 =?us-ascii?Q?UNtqzrO+ipD97Z1E+hN5bLNt4y9GOxD1PhxCsHIz3bpVMF0Myd/UuKHrzNiu?=
 =?us-ascii?Q?oZ7opXjrkW6mLpLrXfaKc5gqhjtAa22o/+/0bw8tbxFKrhDKEm57FIWT3mHj?=
 =?us-ascii?Q?JX8WmXJvaBesJgPq7Uqoh8m0VHI2W0kMzB4xRnIxESVUFj2EYRnZTd/tdqko?=
 =?us-ascii?Q?OqMQ7RyWZo9WH09+PZFzZqXMUsml585l0CdsuD4NQVgikq7xHOg1cCJJBb0P?=
 =?us-ascii?Q?N6LM5EBlJw72F6K97CUTM3IoSY20tPEaTR059m3mLN8IpSi4kr1w1NCyuUOZ?=
 =?us-ascii?Q?JqwN3CgwPYopDCWq6tPFGWCfcjGnLO3D1EAgwUh5Nhhoi/xPbyh4VuA/nufQ?=
 =?us-ascii?Q?mQZ4G3m1FILazIh7/SAKlahSfa4NKz3X8b3mZ/l0kBgHl9dmHPovcVX4hdfH?=
 =?us-ascii?Q?EpLXU8VHneHN1XXLsXq2fbZHbSImq2SHmwOFWL6+hSx+vMEIlfxe0Z6TYXPX?=
 =?us-ascii?Q?O82WJssMZJKzBy1ySXpEZnromCdA35bhv94kkLCkYjnVjTJqGGtiCvf0zZIN?=
 =?us-ascii?Q?0lgPjv1AlyomTXNtMJEhsEYlERzlnRD98c1QHWQACNFueJNJRZYwbOY8s5wR?=
 =?us-ascii?Q?yuA/kkRB7abXJZ5q0dnDGEkQKZ2B4dSxKw1M+od5gKb87Yjm2DfaSL9sgncY?=
 =?us-ascii?Q?DeB8gvvtffbQ1EznciUbcF09FQBA8zPQzv2a4G4dskIRFAMr+5VIF5K6nF5f?=
 =?us-ascii?Q?4GpvEHSUJzRrFIXzQPYtbXjH9pAIXKjy7/RQOfUTDIULdGkYejazowE6fO+b?=
 =?us-ascii?Q?tgfI98/F+QqLFvAj/9yxr32ThN4eqR4iM7i1V5eZOYWQXd1enNhEw2TpfXF6?=
 =?us-ascii?Q?5dqCTw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR19MB6147.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6aee14b-6694-4983-5938-08dd624ce43f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 16:34:14.2364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xh8Yd0e8HIIDDJbD+wLMOMQ2nA3zxwx6BGXQp2qcamDdG1TMQgzycENl7Z0YvfKrdFLze1lekmoeUAzICBAcBfGjOGenjW6RwRlDhtsFJ2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4106
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_07,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 clxscore=1011 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130128
X-Proofpoint-ORIG-GUID: vVVMmBlG1iDmkPzHodrG-d2J6lYv7Neb
X-Proofpoint-GUID: vVVMmBlG1iDmkPzHodrG-d2J6lYv7Neb
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 priorityscore=1501
 spamscore=0 adultscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130128
X-Mailman-Approved-At: Fri, 14 Mar 2025 08:16:01 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Sent: Wednesday, March 12, 2025 1:38 AM
> Subject: [PATCH v2 0/2] drm/msm/dp: Introduce link training per-segment f=
or
> LTTPRs
>=20
> Recently added Initial LTTPR support in msm/dp has configured LTTPR(s) to
> non-transparent mode to enable video output on X1E-based devices that com=
e
> with LTTPR on the motherboards. However, video would not work if addition=
al
> LTTPR(s) are present between sink and source, which is the case for USB T=
ype-C
> docks (eg. Dell WD19TB/WD22TB4), and at least some universal
> Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
>=20
> First, take into account LTTPR capabilities when computing max link rate,
> number of lanes. Take into account previous discussion on the lists - exi=
t early if
> reading DPCD caps failed. This also fixes
> "*ERROR* panel edid read failed" on some monitors which seems to be cause=
d
> by msm_dp_panel_read_sink_caps running before LTTPR(s) are initialized.
>=20
> Finally, implement link training per-segment. Pass lttpr_count to all req=
uired
> helpers.
> This seems to also partially improve UI (Wayland) hanging when changing
> external display's link parameters (resolution, framerate):
> * Prior to this series, via direct USB Type-C to display connection,
>   attempt to change resolution or framerate hangs the UI, setting does
>   not stick. Some back and forth replugging finally sets desired
>   parameters.
> * With this series, via direct USB Type-C to display connection,
>   changing parameters works most of the time, without UI freezing. Via
>   docking station/multiple LTTPRs the setting again does not stick.
> * On Xorg changing link paramaters works in all combinations.
>=20
> These appear to be mainlink initialization related, as in all cases LT pa=
sses
> successfully.
>=20
> Test matrix:
> * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland
> 	* Left USB Type-C, Right USB Type-C
> 	* Direct monitor connection, Dell WD19TB, Dell WD22TB4, USB
>           Type-C to HDMI dongle, USB Type-C to DP dongle
> 	* Dell AW3423DWF, Samsung LS24A600, dual Samsung LS24A600 (one
> 	  monitor per USB Type-C connector)
> * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland
> 	* Left USB Type-C, Right USB Type-C
> 	* Direct monitor connection
> 	* Samsung S34BG85 (USB Type-C), Dell U2725QE (universal
>           Thunderbolt/USB Type-C, probes with an LTTPR when in USB
>           Type-C/DP Alt mode)
>=20
> In both cases, "Thunderbot Support"/"USB4 PCIE Tunneling" was disabled in
> UEFI to force universal Thunderbolt/USB Type-C devices to work in DP Alt
> mode.
> In both cases laptops had HBR3 patches applied [1], resulting in maximum
> successful link at 3440x1440@100hz and 4k@60hz respectively.
> When using Dell WD22TB4/U2725QE, USB Type-C pin assigment D got enabled
> and USB3.0 devices were working in parallel to video ouput.
>=20
> Known issues:
> * As mentioned above, it appears that on Gnome+Wayland framerate and
>   resolution parameter adjustment is not stable.
>=20
> Due to lack of access to the official DisplayPort specfication, changes w=
ere
> primarily inspired by/reverse engineered from Intel's i915 driver.
>=20
> [1]
> https://urldefense.com/v3/__https://lore.kernel.org/all/20250226231436.16=
1
> 38-2-
> alex.vinarskis@gmail.com/__;!!LpKI!hlok7KSBKQntrFMYAFr0mFGIjXmlwtqOD
> mQuO_6YwQ1pNJWCY9KqVJjzRZFzLv9fDgYOinq0MkYpccsMJFtXiQWvlNs2$ [lo
> re[.]kernel[.]org]
>=20
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Tested-by: Laurentiu Tudor <Laurentiu.Tudor1@dell.com>

---
Thanks & Best Regards, Laurentiu

> ---
>=20
> Changes in v2:
> - Picked up Abel's R-b tags
> - Fixed typo as per Abel, fixed readability as per Johan
> - Updated cover and commit message on mailink issue which appears to be
>   specific to Gnome+Wayland. No problems on Xorg.
> - Link to v1:
> https://urldefense.com/v3/__https://lore.kernel.org/all/20250310211039.29=
8
> 43-1-
> alex.vinarskis@gmail.com/__;!!LpKI!hlok7KSBKQntrFMYAFr0mFGIjXmlwtqOD
> mQuO_6YwQ1pNJWCY9KqVJjzRZFzLv9fDgYOinq0MkYpccsMJFtXiW5uR0d1$ [l
> ore[.]kernel[.]org]
>=20
> ---
>=20
> Aleksandrs Vinarskis (2):
>   drm/msm/dp: Fix support of LTTPR handling
>   drm/msm/dp: Introduce link training per-segment for LTTPRs
>=20
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 137 +++++++++++++++++++---------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  31 +++++--
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  30 ++++--
>  drivers/gpu/drm/msm/dp/dp_panel.h   |   2 +
>  5 files changed, 141 insertions(+), 61 deletions(-)
>=20
> --
> 2.45.2

