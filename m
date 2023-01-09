Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECAB662E90
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 19:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D803C10E466;
	Mon,  9 Jan 2023 18:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 543 seconds by postgrey-1.36 at gabe;
 Mon, 09 Jan 2023 12:10:54 UTC
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0E310E3FE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 12:10:53 +0000 (UTC)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
 by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3097tdLg010736; Mon, 9 Jan 2023 04:01:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=L+JxC2r60GKVKyfNHLSVFMvylpuzmFrKCQgX8HUxyGQ=;
 b=MDAQjLWRI1rJlX/PBF6qcqEUpEIeOCrFmed4YnGA8s9LwsGV4hzUJ9jH0Voaa8OIZeRZ
 2zNQDY1jmGvbaBd64LZcynWCZKiyCTk1Z/VvSWAIzScYJdmszNdR0L0D9TZhwwXJhax1
 9TT/xg7HMHT4gTomcQNnZZrrnkKzBjenMroI8Z+xG/9skNvGlK7G0f6FZHAz5nkxj3KN
 QY94hScQdiW/7Vz5Q9GB2Z8gKl8paSJRJev+ppsYjdhGyPfmfX7zS+E/lgOFeb+ukW7Z
 gGnIsWHK7xsiaYBMhJd1YTwxDgJYUC7tXkL09hTIRBPs9i+1tMurDVyl/2TpvlG5ARl3 sA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3my88n730k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 04:01:41 -0800
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ABD8CC00F3;
 Mon,  9 Jan 2023 12:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1673265700; bh=L+JxC2r60GKVKyfNHLSVFMvylpuzmFrKCQgX8HUxyGQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=BbfT/l30Ii1H5zpIJENbZs7BkB+glimQ6p/5xpn/Cgg0ss0OntJ/fJKGtmkk/f4e4
 AvzCjT6LujgnJKZ7ilvX0wi/H7E0nOVGbM+kETWP1R/7rzJwsblv4kvqHkRjti+dIF
 kynIRNQBBdztMS/SDTJ8/6yWtaAi730/i6UZAeUSO26RThjFlkUAcaQJa5bFElhlZt
 xxrSiFVE3/fz4PFWKxFNOQ1dh95ZHI21ctnNX8iEtJCd/vRMpcoZ/bvCHXGOPLxbDP
 hZ0jqdsY6LEb6hh4cg4GZzAdFa8pnpuGCoPqx87qb7AUcI21PwwDDUtu3RBVAewOhi
 lyY0vY4gQAUGQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com
 [10.202.1.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 69C35A005F;
 Mon,  9 Jan 2023 12:01:38 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 77E44A0977;
 Mon,  9 Jan 2023 12:01:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKu1jQ1rMO/K1LgRH+Kc7dBfGV67EcbEGgtCzRp4YQX07PRrppcH72TDqyG6MfE4z+mUPjMtEn1rjPbEBDw4MZP3oe8PFwkBYaccQS5YAWvMiWCUM9PoT0cJhMBobatNz5yWWCwoxf6lNuLZuc6Ao4gMlZV900tPGqIngUt3hNggbPJOwZJUHlrOpYV8ydu/RqT9j3w5pYPoQ56dPqNbzY6GbtJeo46qHLCcTVPMrTuC0FAEdb5EqEbZtISwR7pytfXVBhGrzvf6RKyWc1eCCg3DQrnpYK59wz4Hc5YopJfXwwRL3GSP7CdUly2EjXv0JgfPUPteZ8zCW6xAtdJD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+JxC2r60GKVKyfNHLSVFMvylpuzmFrKCQgX8HUxyGQ=;
 b=I9/5H/T74bf8b+fniPjxvnOV4omvkujw/owLC2UJv9ke77elb1vwSXYO+UsWTmZvoJ//+9YxAGW35fX2+46X14rZiihRB+z5fJsGMhubl3aQm7hp9c7HpbJDaALqw2aVrk9zfIT7lDZbp5lxguEwc5MtG0Vn/Uxl9Vj6oREszBVSmYKnI6QRyS9MScys5AldS+lPr3nhT6YNmDTpDZSMz0L4D6G0eht+brkDv1HL8zOa8m+klTQPMXcXQhVXlRwphchbcpLXbLsSi5St0ahS7IeNcLu9yAYoHiF6bwJgFBBrKJFvct7mv13YSPeQb2RdyqCCv1jEhjFffei/wvbNiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+JxC2r60GKVKyfNHLSVFMvylpuzmFrKCQgX8HUxyGQ=;
 b=SIzWP/qO47+2tCw6++U6oY+BFVBFiXs18P7IR/FQv4miYcpmcFURbcvptR9m66TB4OLCVAfSc9awcTilXD+xra6qusFsyEBBPRm51zTJlsetj51fm3BPKQ01yEjSMh8Bd2TXMJ/uhGPztWbkVmiuv9neCbhiRYz3VICiKo4Gn7k=
Received: from IA1PR12MB6210.namprd12.prod.outlook.com (2603:10b6:208:3e6::14)
 by CY8PR12MB7219.namprd12.prod.outlook.com (2603:10b6:930:59::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 12:01:33 +0000
Received: from IA1PR12MB6210.namprd12.prod.outlook.com
 ([fe80::16c7:28a8:a8bd:293b]) by IA1PR12MB6210.namprd12.prod.outlook.com
 ([fe80::16c7:28a8:a8bd:293b%8]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 12:01:33 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: =?iso-8859-1?Q?Ma=EDra_Canal?= <mcanal@igalia.com>
Subject: Re: [PATCH v2 3/7] drm/arc: use new debugfs device-centered functions
Thread-Topic: [PATCH v2 3/7] drm/arc: use new debugfs device-centered functions
Thread-Index: AQHZJCF6nNAsMuQ2EkyTDr2S8240dK6V+y91
Date: Mon, 9 Jan 2023 12:01:33 +0000
Message-ID: <IA1PR12MB6210A23B56CA0BE8337F9994A1FE9@IA1PR12MB6210.namprd12.prod.outlook.com>
References: <20230109115520.40088-1-mcanal@igalia.com>
 <20230109115520.40088-4-mcanal@igalia.com>
In-Reply-To: <20230109115520.40088-4-mcanal@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6210:EE_|CY8PR12MB7219:EE_
x-ms-office365-filtering-correlation-id: 64adb465-d0d2-4c6e-2b28-08daf2394046
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7XN+gGcqjeZ2bvkkoyyr9fC9aAiCmdhqBLlq6zoieIbBTc/XcDzj/+/f9QAg3WnymOjaOFdKh4bCrBc276iwDYLry4E7duFlF3wQgElcxTk7nvitWZRyJz+aEl5dFGlm0TDb0dOCpp6TvrY9H8XDort71ZMkr4AltrIwAI/ojzU3rns9SlNJJPj7fZN1FNB/GoNdUbDNEd7h0TMGqwQvAuCKelZxx81Pv7xZgT/X8KiaRZB4yZRXQ7/D+GjJuUyA5KLGs/4J99BMxv2cSkvzFKOGaZ3foQGQ0Ts1h0ABDRJUexBXlDw9UkegF4jrumBfUkmv0wb+2GOk6yP4fTY4USAHlFOPhq1yeyJW839TP5/1EmWWwIz6UQJqbsq+8/27aHYs7vvEmTqfl68kEll3E38pgnqHtUJyt765+Nnah+uR7++892GRH3pqLcac7eaahvg87P4oeoyBRoHWf8OjoSy6wVjuGyLbAIyBvzcJJc/kpLowu0BB3j9ujz1jisW5BKSs4RoOqVbRCFAmcl7otqHQNvpHEq5jf1FunOarEPJHmcxosyUxrbQstXttPAt9S1rCrvJT1lhnWfB6nOTmpFmk+PPPk0utp6U3il/AusEcuBYDaB6fNICR/WVPRPJ6KtXlqiW30cthypd81yBSTL0gs2WHEJONcoq5XmnJ0g98ykUHPIXAekiWoy/WWkFmPId6Wlsmux4riT0lSJBoZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6210.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199015)(6506007)(38100700002)(122000001)(2906002)(478600001)(4744005)(33656002)(7696005)(26005)(186003)(9686003)(5660300002)(316002)(71200400001)(83380400001)(8936002)(52536014)(55016003)(38070700005)(86362001)(41300700001)(8676002)(66946007)(76116006)(91956017)(66476007)(66556008)(6916009)(64756008)(54906003)(66446008)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QeptvNGYu6ZzyTz6VXNfEVmc4RByDDKSaVh9vqvN+lfnPBscMYY4xH1V51?=
 =?iso-8859-1?Q?qk5cAG/BHrUVK/cnzCoLh3bwPma7kz85eBZMnJjgL1/tZt4xAlsF9C7PrL?=
 =?iso-8859-1?Q?TgxdZiDeW2KS29At0WxWbxig8gGPQBcbsA26lV2eQ+kzGziwfJiX9dlujY?=
 =?iso-8859-1?Q?vC4nfkpuUB9LUmtC4kCwp8JJXweO3CfRLmQfk4ai4rPGI1w0cPXnxPHKuC?=
 =?iso-8859-1?Q?02XOoUowzcjT+DbH/cs/iM6B6Yx+H99W0Mi/bDs9/iFzFQHVpRZiNFEL4C?=
 =?iso-8859-1?Q?9v/a+SECD3WJjmk+k08U+Oc+wnuAYDMF9Kh1aehO5iu4SY1vT3sa0mktNN?=
 =?iso-8859-1?Q?vXADzXDwP3hTPr5sLjKSMkKl3FxFZDBj8UBRVrmDLodhVv0n0ioI0oVgkJ?=
 =?iso-8859-1?Q?Srj1u1fvpQ4cyiHWnlH8KHzA3k3llv47iUe0uRxSwiWyCKMfGovn2yj8ng?=
 =?iso-8859-1?Q?pYgQVL85ad4BFjz96R7kOeQfTF0WCpdyDSC0WL5tSzbEc0i1ZyL/khd8xq?=
 =?iso-8859-1?Q?nILWb8bnW7Kipsw3gn9CjgkLPFViyUeCJ2CcoaSfw/oLHO5+qPXOmIsN73?=
 =?iso-8859-1?Q?BlNGe3MPqiCOx6+vRH7+J4Y/N8K075jKZ1P0dRSxsRblbqMMGRRU8lOmf3?=
 =?iso-8859-1?Q?/4FKbnX1Ndxno6AcbtzoypvadSxaRRViBzzWCPuvUjQtxJwtrrsLJquQAH?=
 =?iso-8859-1?Q?CLuhzxMb8/6vH2vIQflqR2Dm8FXl/vgoBxfbL9bbDCZgeSHLYczG6EG6Yp?=
 =?iso-8859-1?Q?R3t9wr926lQRMkm8GFWZ7BySVuIq3w7I+pH5zjrmsgSIBK8k1XhGKXNZb+?=
 =?iso-8859-1?Q?+sh2LbFe5gH1Rm92lmA326srIX0g4OKe4+A+5emr2tt179K3iSzNw/qmqC?=
 =?iso-8859-1?Q?543QtGkt729UVs/kzUgJVIkIQaxfGR3U61m8Y2U/2JWYTnjwGN+ldtTQdg?=
 =?iso-8859-1?Q?zZ7XViUuMDeo7uQffXq9WuYBmurPXnQ3C+Sq7vtUR7igvFP908tSZ+izZj?=
 =?iso-8859-1?Q?KVb6H7Ak1jmBdnsdNnsMWtSeEuAJXptdUcZcwLoWZiEBcBhfSrMeTAWcN4?=
 =?iso-8859-1?Q?4oOn+Z6GQmsV/mpYsdVieok2ESwiCaYE8gIfhAn5Fc2w89NLprfU40SJPr?=
 =?iso-8859-1?Q?QWp6Q8TMx2OlhWhOs9pId+71M+olKgVLw8UMTaNj78SfcQWQe+7k21AUiu?=
 =?iso-8859-1?Q?VU8BuOzagiTJYCSoVxPOF9TOYo/5xuMossABMHuaGMLQXKoL7yhnX4g4t4?=
 =?iso-8859-1?Q?rvI1DVEPzPwUyqHLTbbx0K9GoH3knEV2GF89uYm29ZTxXq/UGKLobiDtru?=
 =?iso-8859-1?Q?UZ57otCILMTU6NvTr1KTtGjHu3Xi1rBwM32aAVmtQ5qlgKvUtt5qJpVWwR?=
 =?iso-8859-1?Q?qMMCs63THVpBqfbP4ikFEvVNWQrcwuleXz/tmYnQg3vSPBrSjK8Tq2kDvB?=
 =?iso-8859-1?Q?OL+rD8mqjqmb03XKnmCicd2piauW8/fzxXX5Cl4BgaPgaBhlaFwGdjyA6H?=
 =?iso-8859-1?Q?/tJjsFl7mUBH4fjYo27x9OmRckeBDU5Bl5bsHmQIlCDsYIiCLjUiygvVZY?=
 =?iso-8859-1?Q?PRL5dFNf0Jx2pdn/5ubTMZPoswcBingukFcCsphVTatH2lz3Cr30RAmznO?=
 =?iso-8859-1?Q?663G25PVUuSNQSl0raGD/ushCFZGrFoz6y?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 4DGvOA1XVM+kSf16bxP0BYB3nzUyECMDMlmOJa18DcFA1X2ETnIn0P4ljch3eB/+SF960NzjxKFwJVLPMQ7+MgWelyR2D/3MIF29V0vSuM4oCnguv8jYrlxW2/VO6rpdzls+ZGZcTnJ1J4EcMn3YigaO+BMrJa9Cz8XrSNRMIAZDp1Pc9GlQo34eT25mzJg+rDSbKnrb9cJRDIf3+pbbsRsWr16n/V5ioAmxN0+NkTFCe1FBg+Kkj+hJV/VfQT/YJ6Y0Bh/SCAWexlc5j3+bWj68X4rpO3YemMGP4LuedTTApysorUJnd6I1q2daXDFaf/2/jHDz7lXllplQdIZddFpbQ5n7nLGeQnFfzZ30ZdIn9oyQDG4QjkBn30er+hEgcTN08R82ipspppubmvH8naQzYYyveJoaED1+tM5NlIh0oGNrx6Tx+y1jXs8b8x2GAL252BcmD0BIBfS67N5PtQn8MjQHSvkGduWkoMC3+n54Xwlx1ZJ+yksKk6RIGxL7z8016+3uywQXYy0KImBooxzYc+xYWZ+Szk5PlgjqJ969suQoT11wvT+kNa3AdRKdL8ZbI7aAbMra1iJDMYIueP92U9cVoZ6LxJmMq2LzYURFMGLxpCFLUKJ2SGS01dyVd5m9OYntppHA25hj1NmfVPGuvHTKMp6nPLppTJv8NwDaH/Pq8Rzj7XyqIbaKzT0C6BITzKsEi0wrSuEDHZjqfVHSkKZOYWtHa+do7ydh63YHJhXtkC9EnQRAf7Q0c2wnBsQJBFopt0Ne3h9foxKF5fa77dsjMPJ8K7Yg+lD2M6Q4Qb07maveLJt8vvMrsyNPQtQkj7d095FoIf/H5vj4liK+VW56OudSbv+G8NAYyGwUuuJ8CI/YxUomONHmXwVeD0D2jQQXGqhC+UZ0ap6+4m1y+uwtgaZkfwUjIDZhMPs=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6210.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64adb465-d0d2-4c6e-2b28-08daf2394046
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 12:01:33.1432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3vB/MQWC6jcvrxJu/1lrq7nh1HXln2CDZwco1aXH07Z1zuhhVXmorT4GQR7ZcdB1EZQm6j5bgaOZcK9CKR+++w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7219
X-Proofpoint-ORIG-GUID: kBm_jBCpbYKf6bh9hBfwFgFC4u8UdH0n
X-Proofpoint-GUID: kBm_jBCpbYKf6bh9hBfwFgFC4u8UdH0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_05,2023-01-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=864 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1011 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301090086
X-Mailman-Approved-At: Mon, 09 Jan 2023 18:19:25 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ma=EDra,=0A=
=0A=
> Replace the use of drm_debugfs_create_files() with the new=0A=
> drm_debugfs_add_file() function, which centers the debugfs files=0A=
> management on the drm_device instead of drm_minor. Moreover, remove the=
=0A=
> debugfs_init hook and add the debugfs files directly on arcpgu_probe(),=
=0A=
> before drm_dev_register().=0A=
> =0A=
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>=0A=
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>=0A=
> ---=0A=
> =A0drivers/gpu/drm/tiny/arcpgu.c | 24 +++++-------------------=0A=
> =A01 file changed, 5 insertions(+), 19 deletions(-)=0A=
=0A=
Thanks for taking care of ARC PGU driver and =0A=
=0A=
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>=
