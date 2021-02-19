Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A4331F851
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 12:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB71D6EADC;
	Fri, 19 Feb 2021 11:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392E46EADC;
 Fri, 19 Feb 2021 11:23:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIY9idLAW0O2GG9hE44DUC2rRN0rWKewM6gFNZqGjIW+xKhtV/cIf5cGfCUwcwDQ7BnUpEQFNoAEf8zh+IyWiop2TV+EB/CvWn73r/Rphww3krEQ7nklZtX+xJb4IafyX0twof5KdKSYNNE8wOplZE/Z9gt+8H3mIz2NdlYTbEtfzlrMAwdrQXScMHjw39GCMfWPmYmn0Tqh1k2pH6UGj2pC7si1BdqkdSFA+Y0zp+0JmcrHVD0uzgEjBeu89Fnp52UlOx2BKSYHP3O5UeGBAYXYvgU1KpFerRn5SOP+Oh0WHHiKrbF7pweb2KOMQcKL59+11D2veugVxDNLEt1/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO4DrKS6bAF3zmoEvcmG54YpTXo+Q6o/Z+6yrZmMHf8=;
 b=FefJ6T4hZAd4lSKBPl916fIxy+sswbq2RYcvlCSt21LHLWSHzFU4oKL0NRHAuPPO2zf9Z5HXqgjGbdtpyo65gQdqABQObyf1+el8YRk4IHCsCSeilfF4fF7TNWtPSyOz5pYUMC2xscpPcqO3etXdZyN/SMPeylDMwDmjao3IvyUbphaYjBhJqQsMWPlau5Upg8+AfSSRYSYsHh/d5O8dtUr3GoGoyA/FmcV4TryrS6hu/V9rRlMH/BGTV8EM9ZTAUGZbZEqFOEbgNLxciX6gxv3caimJn57a1fvTpDYnlXFwyZC8E2Hha0+VqdgJqUAdqeq7jf08TIXu81QfyDmN/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO4DrKS6bAF3zmoEvcmG54YpTXo+Q6o/Z+6yrZmMHf8=;
 b=wdPbtXsv8k0bPTj0TrtI2Z//dF1IS8dS6wo/JtEnYdTGYkW3CN/fGp+MmduaUTDKgu8FX2jPIXcnPaqLnqo6+RwvIU/Cwp3qbNg2s3O5G3IPssuTtcetfJ9yZe9YDqE1OXUqJRK1M4bDbIGHcMibGCyqA7QP5lAo0t0csvMW/J0=
Received: from MN2PR12MB3022.namprd12.prod.outlook.com (2603:10b6:208:ce::32)
 by MN2PR12MB3581.namprd12.prod.outlook.com (2603:10b6:208:c8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Fri, 19 Feb
 2021 11:23:22 +0000
Received: from MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::49f7:4979:3a0a:4554]) by MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::49f7:4979:3a0a:4554%6]) with mapi id 15.20.3868.027; Fri, 19 Feb 2021
 11:23:22 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amdgpu/swsmu/navi1x: Remove unnecessary conversion to
 bool
Thread-Topic: [PATCH] drm/amdgpu/swsmu/navi1x: Remove unnecessary conversion
 to bool
Thread-Index: AQHXBqlGxuzH5Hrh1kCyT+jowZYiXKpfVMCa
Date: Fri, 19 Feb 2021 11:23:22 +0000
Message-ID: <MN2PR12MB3022A6577B54AF6ED87D2954A2849@MN2PR12MB3022.namprd12.prod.outlook.com>
References: <1613730198-107418-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1613730198-107418-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-02-19T11:23:21.746Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: linux.alibaba.com; dkim=none (message not signed)
 header.d=none;linux.alibaba.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9d387e27-73df-4c85-682c-08d8d4c8c457
x-ms-traffictypediagnostic: MN2PR12MB3581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB35815974CFED5F07E4AC90C9A2849@MN2PR12MB3581.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: npL8C7s5udfVg/9x/eQUdHDWV+ArfXHTqSjauy/AcjSc8L+tMPCDf1HaoeIq6o0zCkLn0QomhSrp+iiTAHsUouk+1116kfI6Zg/HOypZ/qFxThIKZPPDdXgyJ3pmJT/SrCI30K4K+8hvpqSX+z9FSh8QBiJ6pz8NQaX9T5/75h8cXzAiup43iRdvXKu0ToBt+x8ZjlAvK3OjEWkLRoxf69rl4HSiBw4pTdtt8TIiUJt1jFytZ8Kmnf6o4GK/LLOGvHUft/OBAZgemuJcZ4KTZU1+0MWoAjEoWdfFHJEK4JtVj/XUXZ5+6BgQ187EsmxbNIPaxSF6gobgYyc3pxyj1KLeZgVQ/ctEvADhvYqpG4ABSAOb+aDSfV1sYR53m/RO9IUtUqpUVkGDOfu76rCsoKgvSMiP+g3uzfi63PYMp+FFi9nGBfQiChe/C2xP0HrBNxk5QYi7L131vQF1q1diuhhfEweN4dkPsaOqgYK/nhdGsujNXwb5fpCrz8aXWRTPMbzdF/F2K1+6AYh2OwwU5gfOyDn/K+/u2bwlg4Ooy8GlOccqqRmDEcr7uAxo67WdHo5/V7F/wdn4t/ch+wFXsBIN/uwvKGMyJ9PY2wtHb5I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3022.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(6636002)(86362001)(71200400001)(2906002)(76116006)(64756008)(166002)(66446008)(4326008)(66556008)(8676002)(54906003)(110136005)(26005)(478600001)(5660300002)(966005)(6506007)(53546011)(7696005)(8936002)(83380400001)(66476007)(19627405001)(186003)(9686003)(52536014)(316002)(45080400002)(66946007)(55016002)(33656002)(91956017)(357404004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?CcgTgwCWUtxXx8HbL4UiaAGJ9YmhGIgdN0rOnod+BiVA5+dOKj/BObudJA?=
 =?iso-8859-1?Q?ak0k6h2nMZLNr7gvSt/HTRkmDxD8JCVQrC2n3deu/9KIb1/jLtEyojnewj?=
 =?iso-8859-1?Q?I/cwhhPq/jiIe4UNxDEE+xJV6AvcZAIWDeXg4YFPyz6NE+EdddLfQLfR9q?=
 =?iso-8859-1?Q?If+rUD2SD4iCx+LHOACfOygA37KIXcUq7inNWVqeaRcbz2SCxeGZbrpLSZ?=
 =?iso-8859-1?Q?RQddQgahjePlS/aT0W1Ppvz/OrAbOT7a2SflBM4FXSeFEtSklpYfrwM2FE?=
 =?iso-8859-1?Q?G6cXzwUe27xi7w/mwr8ju5yLHFvetjbpmJowh+pYFZlAxOvILiJQ83O8rn?=
 =?iso-8859-1?Q?3uqo2BD+OtQEtfzJrNH6LUXzsK75yG19w6W79hoHGEzcSlrCc/zqdiBGbz?=
 =?iso-8859-1?Q?tmZrOvZ+b8a5MlX5nHxBqY+muEUoKIm+lWDBLWk9nI1Mhi4bYMuOqpCjcD?=
 =?iso-8859-1?Q?qmA1RwuOrH2Q7zh0Dv+0BNsdhke6UuoL1w8fSxl2GIJ/fzw3SZfWlsnCp7?=
 =?iso-8859-1?Q?cgdkplSKQkXXoCVYeaNLsKh6Lcom6KWQ07QwBa0wfUFkyD2d+mHBEbVTFY?=
 =?iso-8859-1?Q?7n89dpNP+c5MnI4d8RImLDWqvUEsYkbzN71u3thi7KU3kXga5sVFEez/qJ?=
 =?iso-8859-1?Q?PmuRTAiDSJRnVzwtIV/yEAMHPsQl/ttScdIb3IwHP1OQFvFhPuibMOAw3u?=
 =?iso-8859-1?Q?TcCcv5Jj0bELN6cJNrjsNfgFNMo6U3+dzJzrrPuvTTqjIknTjdF9T8Mckm?=
 =?iso-8859-1?Q?Vm4PXnZu15G5S+D/+lYH4dG+aC/r61+fShLip8GHv29UFt3jph6rXtZPLI?=
 =?iso-8859-1?Q?rdD46oe+m4/PTqQ09+G3ZlcQ7kBqdONRfoxzj4vxWck2u8P7YWyMxY6olZ?=
 =?iso-8859-1?Q?VTCmb5v7S/xiM7IhMjxehVTwDShr+k54RuECJ6K6bSI2l012rHUNkbWnuZ?=
 =?iso-8859-1?Q?WXNf1eXYzNPwS1EowKzi8CcEeGRgKbEh1BWamnf3YhUDk9a3Q0JrkVqWeD?=
 =?iso-8859-1?Q?axjwKHdJaPeGJ6NYaDb9I7P3LSon7xLX5tjiNdeHkcEFIscQNSaygkogPa?=
 =?iso-8859-1?Q?X9ElSFptSfz1Zdeq1o2rCNdkrqEWyLzKlsmDjyzb7O27X7iAKjLJ533OJ0?=
 =?iso-8859-1?Q?tbtfmD/5xyS6WW0Fq1BPml0uTel+UmOL7pjCalPr62fA/J8SyKkRS4c1lx?=
 =?iso-8859-1?Q?SBWTbBdx38ImY3S0EVjzLlPWlzV1a7s+m3d5WqIKXCiJyJVEPPRR0mOyNB?=
 =?iso-8859-1?Q?TBWZZY3n9/bwilTgEttJe5V7gn8f/1hf9mr/tJCqvh+DvLTV5m7ePEJsZH?=
 =?iso-8859-1?Q?lH8wxnX/Qo18IxkHxrm8oDbIwb2m12HCk5I1PFmO2r9wRv07bNFgCGMfQ6?=
 =?iso-8859-1?Q?amfr6NfCfE?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3022.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d387e27-73df-4c85-682c-08d8d4c8c457
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2021 11:23:22.4066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t++ov7CjTmVU0pki9UXpRLcvHT7aCCwV/CrF5/fQFszW1cKsfhqiPj6hKidqBmN5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3581
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1636093635=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1636093635==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3022A6577B54AF6ED87D2954A2849MN2PR12MB3022namp_"

--_000_MN2PR12MB3022A6577B54AF6ED87D2954A2849MN2PR12MB3022namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Hi Jiapeng,

         /* 0 - Fine grained DPM, 1 - Discrete DPM */
-       return dpm_desc->SnapToDiscrete =3D=3D 0 ? true : false;
+       return !(dpm_desc->SnapToDiscrete =3D=3D 0);

the code logic is wrong, the '!' is not needed.

Best Regards,
Kevin
________________________________
From: dri-devel <dri-devel-bounces@lists.freedesktop.org> on behalf of Jiap=
eng Chong <jiapeng.chong@linux.alibaba.com>
Sent: Friday, February 19, 2021 6:23 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>; airlied@linux.ie <airl=
ied@linux.ie>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>;=
 dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-gfx=
@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Koenig, Christian <=
Christian.Koenig@amd.com>
Subject: [PATCH] drm/amdgpu/swsmu/navi1x: Remove unnecessary conversion to =
bool

Fix the following coccicheck warnings:

./drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:900:47-52: WARNING:
conversion to bool not needed here.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/=
drm/amd/pm/swsmu/smu11/navi10_ppt.c
index cd7efa9..dc9ce86 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -897,7 +897,7 @@ static bool navi10_is_support_fine_grained_dpm(struct s=
mu_context *smu, enum smu
         dpm_desc =3D &pptable->DpmDescriptor[clk_index];

         /* 0 - Fine grained DPM, 1 - Discrete DPM */
-       return dpm_desc->SnapToDiscrete =3D=3D 0 ? true : false;
+       return !(dpm_desc->SnapToDiscrete =3D=3D 0);
 }

 static inline bool navi10_od_feature_is_supported(struct smu_11_0_overdriv=
e_table *od_table, enum SMU_11_0_ODFEATURE_CAP cap)
--
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04%7C01%7CKevin1=
.Wang%40amd.com%7C1709e8c3e5c44eb4d06b08d8d4c067d9%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637493270133033509%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D=
tX8xq%2B31iYrBp3lLN7KKOBP3k8lMpecaX0ZSZf7c6y4%3D&amp;reserved=3D0

--_000_MN2PR12MB3022A6577B54AF6ED87D2954A2849MN2PR12MB3022namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;segoe ui&quot;, &quot;segoe ui web (west =
european)&quot;, &quot;segoe ui&quot;, -apple-system, blinkmacsystemfont, r=
oboto, &quot;helvetica neue&quot;, sans-serif; font-size: 11pt; color: rgb(=
32, 31, 30); background-color: rgba(0, 0, 0, 0);">Hi Jiapeng,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color: rgb(32, 31, 30); font-family: &quot;segoe ui&quot;, &=
quot;segoe ui web (west european)&quot;, &quot;segoe ui&quot;, -apple-syste=
m, blinkmacsystemfont, roboto, &quot;helvetica neue&quot;, sans-serif; font=
-size: 11pt; background-color: rgba(0, 0, 0, 0); display: inline !important=
;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 /* 0 - Fine grained DPM, 1 - Discrete DPM */</span><br>
<span style=3D"color: rgb(32, 31, 30); font-family: &quot;segoe ui&quot;, &=
quot;segoe ui web (west european)&quot;, &quot;segoe ui&quot;, -apple-syste=
m, blinkmacsystemfont, roboto, &quot;helvetica neue&quot;, sans-serif; font=
-size: 11pt; background-color: rgba(0, 0, 0, 0); display: inline !important=
;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 return dpm_desc-&gt;SnapToDiscrete =3D=3D 0 ? true : false;</span><br styl=
e=3D"color:rgb(32, 31, 30);font-family:&quot;Segoe UI&quot;, &quot;Segoe UI=
 Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSy=
stemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667p=
x;background-color:rgb(255, 255, 255)">
<span style=3D"color: rgb(32, 31, 30); font-family: &quot;segoe ui&quot;, &=
quot;segoe ui web (west european)&quot;, &quot;segoe ui&quot;, -apple-syste=
m, blinkmacsystemfont, roboto, &quot;helvetica neue&quot;, sans-serif; font=
-size: 11pt; background-color: rgba(0, 0, 0, 0); display: inline !important=
;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 return !(dpm_desc-&gt;SnapToDiscrete =3D=3D 0);</span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color:rgb(32, 31, 30);font-family:&quot;Segoe UI&quot;, &quo=
t;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, =
BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-siz=
e:14.6667px;background-color:rgb(255, 255, 255);display:inline !important">=
<br>
</span></div>
<div style=3D""><font color=3D"#201f1e"><span style=3D"font-size: 11pt; fon=
t-family: &quot;segoe ui&quot;, &quot;segoe ui web (west european)&quot;, &=
quot;segoe ui&quot;, -apple-system, blinkmacsystemfont, roboto, &quot;helve=
tica neue&quot;, sans-serif; color: rgb(32, 31, 30); background-color: rgba=
(0, 0, 0, 0);">the
 code logic is wrong, the '<span style=3D"background-color:rgb(255, 255, 25=
5);display:inline !important">!' is not needed.</span></span></font></div>
<div style=3D""><font color=3D"#201f1e"><span style=3D"font-size: 14.6667px=
;"><br>
</span></font></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color: rgb(32, 31, 30); font-family: &quot;segoe ui&quot;, &=
quot;segoe ui web (west european)&quot;, &quot;segoe ui&quot;, -apple-syste=
m, blinkmacsystemfont, roboto, &quot;helvetica neue&quot;, sans-serif; font=
-size: 11pt; background-color: rgba(0, 0, 0, 0); display: inline !important=
;">Best
 Regards,</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color: rgb(32, 31, 30); font-family: &quot;segoe ui&quot;, &=
quot;segoe ui web (west european)&quot;, &quot;segoe ui&quot;, -apple-syste=
m, blinkmacsystemfont, roboto, &quot;helvetica neue&quot;, sans-serif; font=
-size: 11pt; background-color: rgba(0, 0, 0, 0); display: inline !important=
;">Kevin</span></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> dri-devel &lt;dri-dev=
el-bounces@lists.freedesktop.org&gt; on behalf of Jiapeng Chong &lt;jiapeng=
.chong@linux.alibaba.com&gt;<br>
<b>Sent:</b> Friday, February 19, 2021 6:23 PM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> Jiapeng Chong &lt;jiapeng.chong@linux.alibaba.com&gt;; airlied@l=
inux.ie &lt;airlied@linux.ie&gt;; linux-kernel@vger.kernel.org &lt;linux-ke=
rnel@vger.kernel.org&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lis=
ts.freedesktop.org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.fre=
edesktop.org&gt;;
 Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu/swsmu/navi1x: Remove unnecessary convers=
ion to bool</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Fix the following coccicheck warnings:<br>
<br>
./drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:900:47-52: WARNING:<br>
conversion to bool not needed here.<br>
<br>
Reported-by: Abaci Robot &lt;abaci@linux.alibaba.com&gt;<br>
Signed-off-by: Jiapeng Chong &lt;jiapeng.chong@linux.alibaba.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/=
drm/amd/pm/swsmu/smu11/navi10_ppt.c<br>
index cd7efa9..dc9ce86 100644<br>
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c<br>
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c<br>
@@ -897,7 +897,7 @@ static bool navi10_is_support_fine_grained_dpm(struct s=
mu_context *smu, enum smu<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dpm_desc =3D &amp;pptable-=
&gt;DpmDescriptor[clk_index];<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 0 - Fine grained DPM, 1=
 - Discrete DPM */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dpm_desc-&gt;SnapToDiscrete =
=3D=3D 0 ? true : false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return !(dpm_desc-&gt;SnapToDiscrete =
=3D=3D 0);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static inline bool navi10_od_feature_is_supported(struct smu_11_0_ove=
rdrive_table *od_table, enum SMU_11_0_ODFEATURE_CAP cap)<br>
-- <br>
1.8.3.1<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
dri-devel@lists.freedesktop.org<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;data=3D0=
4%7C01%7CKevin1.Wang%40amd.com%7C1709e8c3e5c44eb4d06b08d8d4c067d9%7C3dd8961=
fe4884e608e11a82d994e183d%7C0%7C0%7C637493270133033509%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C10=
00&amp;amp;sdata=3DtX8xq%2B31iYrBp3lLN7KKOBP3k8lMpecaX0ZSZf7c6y4%3D&amp;amp=
;reserved=3D0">https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;data=
=3D04%7C01%7CKevin1.Wang%40amd.com%7C1709e8c3e5c44eb4d06b08d8d4c067d9%7C3dd=
8961fe4884e608e11a82d994e183d%7C0%7C0%7C637493270133033509%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;amp;sdata=3DtX8xq%2B31iYrBp3lLN7KKOBP3k8lMpecaX0ZSZf7c6y4%3D&amp=
;amp;reserved=3D0</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB3022A6577B54AF6ED87D2954A2849MN2PR12MB3022namp_--

--===============1636093635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1636093635==--
