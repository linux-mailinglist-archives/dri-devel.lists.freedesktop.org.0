Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877357AB39D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 16:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C7810E677;
	Fri, 22 Sep 2023 14:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED9F10E042
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 09:41:50 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38M79LaO028142; Fri, 22 Sep 2023 09:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=SlRRkLNr5OjKsq5gzSI9t+E7LW/OS59U72FhWaLOpY0=;
 b=W5E6pr0oTZRUiByerJysLxLLWs383zeUUhfqZEkVuFBPFyczd7kzLjn71fbOkBs2ddHl
 hzHuynSUK/vCL2b2X+0qyTvElMwp8/+7CC4dR0ckJXT0SLyTGfKa1cTugMwAhrEwOY+g
 SVUk6vr5jymUliYK5z32QD0mehmcwkBp9pGVhmsN3q6XyeKPgDTq9Pyen1GwMR8MIQig
 5mmerjVxnJ3XIAWsILlkhaOJf+EQzhftSZDi1PanaOkAk5wYYXisCkb8s3pnkXo21rJi
 M3LvYmsn0jKG5rvVTG1bICC/nqJ2FVLVXjm7/ocUwQfFI8dSQrYKb+tDvlCRVk6pfVb8 yA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8uf2hd8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 09:41:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gea0vOtA/aZsiFto5BO9waaQJmsfUfP7DyNPJ4AgEI3a1BplqO9w/wNCOWM/hOm73M7dqILECUtNYHsziTAhihRPDdBLZNOvFdczgEV244qrEdYlD9cgJLw0WdFsW6p9AZdo38TyIG7C3CGqDLT17uPSYm+AaaNxT1HESr6KlaMvM4kMYBldTPAh80OeO+nsLlL+/HpVkuCEkLq5Agj71LQdOUxIrl0tjXDuUWIDy58dX6h30EufMVu3tp+nCHjRRA3f0Nfh+LtVVBwUqk+tNxGpSog41RfBjYQgn7cdgtSzf7DRkE6O1vi+2T6r18yAugfBU+7bCMcYuVwc0czDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlRRkLNr5OjKsq5gzSI9t+E7LW/OS59U72FhWaLOpY0=;
 b=D6leX+bMroKT6VIwbGgFM1M2VZTRdBoxy/dabJFOSA5BGMeHa1ldq69FDGJO+zGEinvzO5GAlGyy1oNjfei804TQ0hrO7KdOl2A914ObiFTeq5XIRGn6WKPrOXCs/6mgg+wpNP8Ujk22wkyYAehNFb8VIYYB7GnCFWAo+PKHr4FQ7cVFLKMVr8jKJgwYMvvPszD4yqwDVd/I9yI4CekzeFxkjrczI/lIksDupOjV727WqQraIiLdtIfPLRXjMUh//QMlg9gL2p4u5de9q2Wm3KxI9j0NPy2z8/iW7OB+TGvYBuP8x8oTDeugoDXO7XzRUzPi1rM3HDREuhD8SHPw/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB7951.namprd02.prod.outlook.com (2603:10b6:408:169::8)
 by CH2PR02MB6694.namprd02.prod.outlook.com (2603:10b6:610:ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Fri, 22 Sep
 2023 09:41:34 +0000
Received: from BN0PR02MB7951.namprd02.prod.outlook.com
 ([fe80::ed2:9f26:8ab:82fc]) by BN0PR02MB7951.namprd02.prod.outlook.com
 ([fe80::ed2:9f26:8ab:82fc%4]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 09:41:34 +0000
From: Ramya SR <rsr@qti.qualcomm.com>
To: "Ramya SR (QUIC)" <quic_rsr@quicinc.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Lyude Paul
 <lyude@redhat.com>, Wayne Lin <Wayne.Lin@amd.com>, Jani Nikula
 <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jeff Layton <jlayton@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port
 detect
Thread-Topic: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port
 detect
Thread-Index: AQHZ55DQhVb08bi8cEKL8zMH3hln2LAmoqyA
Date: Fri, 22 Sep 2023 09:41:34 +0000
Message-ID: <BN0PR02MB7951B2EC4718D7E2BDD4DC3E81FFA@BN0PR02MB7951.namprd02.prod.outlook.com>
References: <1694753689-29782-1-git-send-email-quic_rsr@quicinc.com>
In-Reply-To: <1694753689-29782-1-git-send-email-quic_rsr@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB7951:EE_|CH2PR02MB6694:EE_
x-ms-office365-filtering-correlation-id: ca0b8dd1-ede2-4fa6-05c6-08dbbb501c1d
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XseomE/9L7dLimgP5/Y/wYYNNcTifBTK2qPOVbnuAQDrlay8ePyTg5mQmST5le+baakMqZyraxV8bGK6iyXFSla1A4Uvk1jF2QjmbnT/KkhalmAW8kVSNVe7cWgMcrQMwVCdSwEU2soS+duvy9KIqLgG/3HULP0nLehMYDTwc3io0UXzRQt/WITKq0LWtWomxCcEJHk5dcNPE1maO8g2VquTNmr6+IpUcc4HRVleg/UbcTksHfERfTGSQyCPUP1/eWkH75q/BCmZMjDSQrtAmzGkPdgv1097aW0pV2xOldnnPFFxMkl7r7+9UTpgk92dPZPKoWFQxH+UinHh5J6B5FjFydUMlG/n63A1FRrKdFkznQSrjtPe3tQ4y77dEO27hKbGl8aQCu7RDI3DFMEtSOSHyZaAd4Jyj7RlfNGnuHLvDehypPYUK/bZx/t50v91uf5CkdKIgiBIb+RAir6rdi0DFpqN/0Tbl/PLX+csS3/kc0PPvL9vJjCG40j3uOYSJx6r3LxyZIR+zPNlYpurgSeeseoqbnwaVdITkJ1D+ORxyzxglhNLK8DUTxtmrhAzqZEQYhB3Ezyq4WDLxMlENWE4pvqJGPpKFgrvG6b1Fn/ws4Cq6wTITupcxG8klZo5UGjr6VVucLs49sFLM355uQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB7951.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199024)(186009)(1800799009)(55016003)(83380400001)(6506007)(53546011)(478600001)(7696005)(71200400001)(26005)(122000001)(38070700005)(921005)(38100700002)(64756008)(9686003)(41300700001)(110136005)(5660300002)(86362001)(33656002)(316002)(76116006)(66446008)(66946007)(66476007)(66556008)(8936002)(8676002)(2906002)(52536014)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6aL+9/K3wnx2hv4bkbFrbs5ozdc+o6SjighwWrvSNRBs7A2jF0F5+pI7zj/s?=
 =?us-ascii?Q?fS3RaHWekdfXGdu+PBWaXBIKIQZmprEuJ2TuPchyBzTMgaCgVf4CLWsIlyU0?=
 =?us-ascii?Q?qAAcmrDjbATEPuLoXGW8o1YGiD/ur3sQ3hibvywSboGNvvJgDs7e5Bc/seZH?=
 =?us-ascii?Q?/FA2jSp8IO8JUBIUx0nX+090JgJBU/bGv377tWe6gtFHD4AwkJFcf5jEZOUK?=
 =?us-ascii?Q?SzzTbOx8urpluvqLVPdwqPdwEDLxzdvfzGSFmPzBWBFt7YaDNEOSA7OEfikB?=
 =?us-ascii?Q?fWmPGsMpQo1HZXeTZSYQNTNaIEBIObPRiTQkT+4oSUFZDIuP1dFc9D5/qyjG?=
 =?us-ascii?Q?HYGFvxg52Suqs59dLbMaeQkrPDi9RwzADJfhKLbd9bvsDYgvKXPZ0PawrUEu?=
 =?us-ascii?Q?XS4ZaPgP1SmMwwPzoByKO6+bNrGLf3iaZkqFpgEX8SF1hrEfZxk+sdkbhzsr?=
 =?us-ascii?Q?lAC9ZAF3mVfbcs4aXrf303QSMp0Tv7TEI978Vsr+lNlO8pJTelfuvKL9Obt2?=
 =?us-ascii?Q?Pq2UHuLK8M3X0rKtGz7Y9pnZAqf+lF3JcIDUZcESTDY2ETQ2sEdy91FxRnEM?=
 =?us-ascii?Q?jAJnOL92pnXpSJ/Gd9/cDjFdtKHgGSizKQpdiXYbrsRejrVsc6gNM2tMs58L?=
 =?us-ascii?Q?zIQoZx7Nf3WMCul/s0y6c0cQuas6cw+X7xvWwHL1m41R7Pe5L/Ap34b2SX3W?=
 =?us-ascii?Q?jIEALu+rq7MD2aeBomTvU9DJJskRriBA0VKkGfcwngc/wztiFUx+4Ka3I8iD?=
 =?us-ascii?Q?Yb7d7JYOcVonXbF7rMyt/3HzPjSK62kTuBlZYdSw16FAqNUvdZyYja7NHBkj?=
 =?us-ascii?Q?smHcQ2QlbE05+5e0/bc3euVCl/ONYvmsm+/0jPgNRJSJRqdMHKh7o61/PeK7?=
 =?us-ascii?Q?D4pnsKCqswylBOnBAg8wxw4P1nLXayRZvYqRwMgBwhD27nZHHxBsFMCbBo93?=
 =?us-ascii?Q?NLnNXtR94p6fxoDLZolJFz0mQefycc08Hmip2oTC9dSpWa3U172H2DC5Oc8n?=
 =?us-ascii?Q?vO6699dpwife9kBHgFAC1/dvPKlOJRYaC+nY1d4W/qtDJjPRz9bfeCMuq5Iq?=
 =?us-ascii?Q?z5gtqy6jdSTqVWio5Dfdf5sQTQkIu+kEybat0TTdgBpgKMSnn87UnJAqdLRG?=
 =?us-ascii?Q?CfMKwXyk1I0nblPQgnUcbgIyHrMl2mHMYrOplmM2HjGXEjoWs2ebLlRTRuin?=
 =?us-ascii?Q?YDditdtoJNoLYF2JcpmVAtw6aDrtsHCMMR7lUr3lHA6ZoBfMBKaZFbj2Hp8M?=
 =?us-ascii?Q?57v+PG6S8GPDMGHf6EiWXm1v4GLEzGQnK466D1+iRqSfown7DiaUXRWksG3v?=
 =?us-ascii?Q?nRL80jGIF9j3K5NWV/YdghRO43TdJYLHq2IsWRpk2h8sawauTywhFZiRK/ZA?=
 =?us-ascii?Q?NA3W9JZH93DQYpyg0J4mnPftyW8Pqcfl1QHoSHRwSIH+/GE3VnXACgnSlOMs?=
 =?us-ascii?Q?+9w6xsCDheTzET35yiFT6upIYAumV5WJfbah1Nu6przMuoOksbEVYN7EVj+A?=
 =?us-ascii?Q?D+mpUzXMO/7eqC/Ux0LDk6EzO9tyEEd+nsmheHQ4mrhpUk0GHb03Ro18DnrI?=
 =?us-ascii?Q?d8/kdekxWCx0vIlygChyYCeVqo3eMN0C2FZoy7L2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?UaeDKb1owkdElHr6MDpKpapq1KAFat90DycyeIacmLRvQeSvjQxhNyuCY4Yr?=
 =?us-ascii?Q?nRBjaxn1vTnbAoXZEEQFfWirEU0Q3PpCky6Dw3rsEx3sjStdzsRYT1wXWQsr?=
 =?us-ascii?Q?BcSunUDRIJ7DiBykDDM837Nx+N3I03hhXX/4v5Z4J6a8bRshIfM16FMJyycr?=
 =?us-ascii?Q?gUlcNNtMh7EWd++fQCMTsD3JK+1hL11eilxvfEWwo/D2sLDrl3ujaNBwCwIY?=
 =?us-ascii?Q?PA26FK9F8e+8FCoFVCqWU/kcp+Xt/gy98kumP6o20HrmotJpNh/yZF6bB0uw?=
 =?us-ascii?Q?FdOkgItb8wHrVhNevJXf0D0EfH/9IQwfvU0EzQTJSJKe4B7L93t6zQCXCoSh?=
 =?us-ascii?Q?8O/RVEuyzoLd2E+yP2jMUEqIrbtbZ/gNIUajA9CADIgP7xqx1+iYK/0Ybnyj?=
 =?us-ascii?Q?edv8xWY2Z6Iqw5OiuSiv7HKKy6iCpsykECaBeieVIc5V/xZv0kFiVJgmNsfu?=
 =?us-ascii?Q?zsI4Pw2/zzGOCjhl776ZXkeLu43QD6MeflJ46sMjK17qFnx9RS2+DODU1BZG?=
 =?us-ascii?Q?2hOIwMCLgHCHY3HU0uZKxsGM1z4vWJQHXcPhDzj/4/JsLZiqwYYIjSjluFvN?=
 =?us-ascii?Q?J1RmFoTPbJswAK9ez+IyOhDbGcqaus6kVukBGbhmaWTguOV1CcQLAlF8YzIK?=
 =?us-ascii?Q?+L4jTKgneCf32z8jUN1yR0yl6f+ssZNVo7OhdQvZxULYeBWPl7KwSwykQQsm?=
 =?us-ascii?Q?EEKRFOExn5G2KhKd/4MIdaVcAUaUp2qJKPYRs93Rl6Ka+QSkcc7dIjf7X/i0?=
 =?us-ascii?Q?7Al5ONU8iReFqVTw6DIpf6wwG5VeNRBAKVfZioWvyErXb8lADmjfHPhyoiU0?=
 =?us-ascii?Q?ibOXNKlAE49ybGIhwaxKCJjDzb0Mvlc2iIpapZqfj8VDkUQ15nKUclmuMyGw?=
 =?us-ascii?Q?LTfY/JlMRfsNa4kvZdF57s4NoNlgrhJ/+Za5TohAbcUrW4M97G8UHaDiGQ4V?=
 =?us-ascii?Q?5cr6R6A7CinteP1zKr3rKOt8VcKkwe+xpf3DH7c5nAUmnS0NIj5zAeYskSAe?=
 =?us-ascii?Q?gIlh?=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB7951.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0b8dd1-ede2-4fa6-05c6-08dbbb501c1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 09:41:34.6486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i38qMe+HF/iTRYNJ1MiGJ7K2Q3sxs0c1nMn0HQu14dxgoxN2ockCSFNpd5tbWHCODk/tynLoUWjGE4qSmMF1Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6694
X-Proofpoint-GUID: gdz57Yt294UDLUloNogL_pX6ab8U7lsS
X-Proofpoint-ORIG-GUID: gdz57Yt294UDLUloNogL_pX6ab8U7lsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_07,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 clxscore=1011 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220080
X-Mailman-Approved-At: Fri, 22 Sep 2023 14:28:57 +0000
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

Gentle Reminder. Please review the commit.

-----Original Message-----
From: Ramya SR (QUIC) <quic_rsr@quicinc.com>=20
Sent: Friday, September 15, 2023 10:25 AM
To: David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Lyud=
e Paul <lyude@redhat.com>; Wayne Lin <Wayne.Lin@amd.com>; Jani Nikula <jani=
.nikula@intel.com>; Imre Deak <imre.deak@intel.com>; Alex Deucher <alexande=
r.deucher@amd.com>; Jeff Layton <jlayton@kernel.org>; dri-devel@lists.freed=
esktop.org; linux-kernel@vger.kernel.org
Cc: Ramya SR (QUIC) <quic_rsr@quicinc.com>
Subject: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port det=
ect

Modeset mutex unlock is missing in drm_dp_mst_detect_port function.
This will lead to deadlock if calling the function multiple times in an ato=
mic operation, for example, getting imultiple MST ports status for a DP MST=
 bonding scenario.

Signed-off-by: Ramya SR <quic_rsr@quicinc.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/dr=
m/display/drm_dp_mst_topology.c
index ed96cfc..d6512c4 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4154,7 +4154,7 @@ drm_dp_mst_detect_port(struct drm_connector *connecto=
r,
=20
 	ret =3D drm_modeset_lock(&mgr->base.lock, ctx);
 	if (ret)
-		goto out;
+		goto fail;
=20
 	ret =3D connector_status_disconnected;
=20
@@ -4181,6 +4181,8 @@ drm_dp_mst_detect_port(struct drm_connector *connecto=
r,
 		break;
 	}
 out:
+	drm_modeset_unlock(&mgr->base.lock);
+fail:
 	drm_dp_mst_topology_put_port(port);
 	return ret;
 }
--
2.7.4

