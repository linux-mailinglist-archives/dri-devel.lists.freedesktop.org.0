Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D2B704B7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 17:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477E489CBA;
	Mon, 22 Jul 2019 15:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790070.outbound.protection.outlook.com [40.107.79.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAD889CBA;
 Mon, 22 Jul 2019 15:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuotYYWr/EIBqXvcvXdujYY8JahiM9GQYvG8HmSsc4HNX4HBfn4o7cjsuJDd3LTnYjmlFaR/LIkPt+4/U1ZMJ4MHdM6jrGxkp4S9kKnWA0Rta9EZNTOn0gePxFQJhiBf5p4LdpAXQLBv1D94SDCW5XPk4S2udshmxEupJL9eTZzbSI3qjHyOK3uEfFoUyQkkCgEuu7/RZ7FzbKtMLbaim1LnnrfjW/FJO0sy4uvIzU3ELHbKsxFGf7DrcZSKP9j2b2erp22WXQo2lmultzJgJvvHc+V0WfcfBDbYMTJxeHkDGZTcqsw4+4kl1xIR+3Idl+ebW6w+be094UBN/o3Iyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jjTyn7cKMfGUINt6YZ+8YojoRGT0rIgYwY11MMd/ZA=;
 b=dSCVDQm0TMNjCrkuwPdBlFXKRfdhsd4jnoETdaJUpRrourqOpQcjh85yqzMdXD47DItpKLKT4hlloWtvqLIX4tsoyWVNpbYm+CnASNpp3Miot3ktEAquISFer/0ymSZVdt3MuFgykLxaCHEHgxqmu05syfamWB6se6D/WrOOWysTCr10FzLAIK8jW+QaS02JkPEUY4NwKFxX4U95JEDVr6jVLFJgVfK/2q9NJDbm+zKSrGEPAItR97abxG1YhbfsYoF2yTQ1nBryWlIBEHharlHB5+cRijnbfVZ4+8xp68Spkn2c8gxBCnQ0KdD99h4kkkLcAuET7hk4ob5hNIRJKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1123.namprd12.prod.outlook.com (10.168.226.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Mon, 22 Jul 2019 15:58:00 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b%11]) with mapi id 15.20.2094.013; Mon, 22 Jul
 2019 15:58:00 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "Gustavo A. R. Silva"
 <gustavo@embeddedor.com>, "Cox, Philip" <Philip.Cox@amd.com>, Oded Gabbay
 <oded.gabbay@gmail.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/amdkfd/kfd_mqd_manager_v10: Fix missing break in
 switch statement
Thread-Topic: [PATCH] drm/amdkfd/kfd_mqd_manager_v10: Fix missing break in
 switch statement
Thread-Index: AQHVQBfxxNiwQ0nPYEC0334ceAIpMabWwAIAgAAMMmM=
Date: Mon, 22 Jul 2019 15:58:00 +0000
Message-ID: <BN6PR12MB18098741A081711936563597F7C40@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190721225920.GA18099@embeddedor>,
 <c735a1cc-a545-50fb-44e7-c0ad93ee8ee7@amd.com>
In-Reply-To: <c735a1cc-a545-50fb-44e7-c0ad93ee8ee7@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.160.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3579c8c-14fd-4350-82b0-08d70ebd5f1a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1123; 
x-ms-traffictypediagnostic: BN6PR12MB1123:
x-microsoft-antispam-prvs: <BN6PR12MB1123BA68B7BAF858F5E28923F7C40@BN6PR12MB1123.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:257;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(189003)(199004)(52536014)(446003)(105004)(11346002)(66066001)(26005)(6506007)(7736002)(74316002)(3846002)(76176011)(7696005)(102836004)(53546011)(186003)(110136005)(33656002)(54906003)(6116002)(14444005)(81156014)(81166006)(256004)(316002)(229853002)(8936002)(68736007)(55016002)(99286004)(71190400001)(4326008)(71200400001)(6246003)(9686003)(76116006)(64756008)(66556008)(66476007)(66946007)(66446008)(8676002)(2906002)(54896002)(486006)(86362001)(53936002)(6436002)(476003)(25786009)(5660300002)(478600001)(19627405001)(14454004)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1123;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TEKTXhR75cabAcq5zuZYOufxH7iTqtQTMsqQXkPB5wWfaLZd+lQdxsmk7T/gdRBU9lKeefBR0hFef8DNGo37uuhbbEBXei07Usgv16VepOW/k5pL+jEAdmeyrS/LNfeazkUVHCyOMTsCMrT0Nq7ljh4BbrEENxg+abf8D6KIxL6CjHzQ8JMtkLM9K/3BXOmR8KFl53dyMGv7R6poipbCjTQ3lKtkotogwJ5b7Nh6ozqG2CfPkqa9uYbks+uzjzTVkuO4ofzS7wo9Ui0dG+0U7l8fgO2DoRBWeAFj/KVI+duvHKiXhEZbQx/SjwIEmyqcgPYSo3lq2+3wwGa4W967guUeoMzwmzeg050bkhD7vBaRTuWCNbzwLe0nj2r8IZpa5DbK9hNJD/eww0sLpf9Rv4TW3sFn9/q09//PmIAgsO0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3579c8c-14fd-4350-82b0-08d70ebd5f1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 15:58:00.1745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1123
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jjTyn7cKMfGUINt6YZ+8YojoRGT0rIgYwY11MMd/ZA=;
 b=T24pTkCzSeqnkIIuDKG9LzbuMt1XVmwBl+owPO1sXMWc675feLyrmcPyo2lGIJEU5KGRShUYbPCou91OGwK1SVR8Y7sNC3u7K3xoCAfQ+91oCxLaWK3ZEsc10kDdmCVWI+diOTxfwS25RgQB93ypFSCZOWyUSevq9ecicZddDoQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1919131890=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1919131890==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18098741A081711936563597F7C40BN6PR12MB1809namp_"

--_000_BN6PR12MB18098741A081711936563597F7C40BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We need to add a /*fall through */ comment then.

Alex
________________________________
From: Liu, Shaoyun <Shaoyun.Liu@amd.com>
Sent: Monday, July 22, 2019 11:14 AM
To: Gustavo A. R. Silva <gustavo@embeddedor.com>; Cox, Philip <Philip.Cox@a=
md.com>; Oded Gabbay <oded.gabbay@gmail.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhou, Davi=
d(ChunMing) <David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel =
Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vge=
r.kernel.org <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/amdkfd/kfd_mqd_manager_v10: Fix missing break in s=
witch statement

This one properly in purpose , The mqd init for CP and  COMPUTE will
have the same  routine .

Regard

sshaoyun.liu

On 2019-07-21 6:59 p.m., Gustavo A. R. Silva wrote:
> Add missing break statement in order to prevent the code from falling
> through to case KFD_MQD_TYPE_COMPUTE.
>
> This bug was found thanks to the ongoing efforts to enable
> -Wimplicit-fallthrough.
>
> Fixes: 14328aa58ce5 ("drm/amdkfd: Add navi10 support to amdkfd. (v3)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/g=
pu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> index 4f8a6ffc5775..1d8b13ad46f9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> @@ -430,6 +430,7 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD=
_TYPE type,
>        switch (type) {
>        case KFD_MQD_TYPE_CP:
>                pr_debug("%s@%i\n", __func__, __LINE__);
> +             break;
>        case KFD_MQD_TYPE_COMPUTE:
>                pr_debug("%s@%i\n", __func__, __LINE__);
>                mqd->allocate_mqd =3D allocate_mqd;

--_000_BN6PR12MB18098741A081711936563597F7C40BN6PR12MB1809namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
We need to add a /*fall through */ comment then.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Liu, Shaoyun &lt;Shao=
yun.Liu@amd.com&gt;<br>
<b>Sent:</b> Monday, July 22, 2019 11:14 AM<br>
<b>To:</b> Gustavo A. R. Silva &lt;gustavo@embeddedor.com&gt;; Cox, Philip =
&lt;Philip.Cox@amd.com&gt;; Oded Gabbay &lt;oded.gabbay@gmail.com&gt;; Deuc=
her, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;Chr=
istian.Koenig@amd.com&gt;; Zhou, David(ChunMing) &lt;David1.Zhou@amd.com&gt=
;;
 David Airlie &lt;airlied@linux.ie&gt;; Daniel Vetter &lt;daniel@ffwll.ch&g=
t;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdkfd/kfd_mqd_manager_v10: Fix missing bre=
ak in switch statement</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This one properly in purpose , The mqd init for CP=
 and&nbsp; COMPUTE will
<br>
have the same&nbsp; routine .<br>
<br>
Regard<br>
<br>
sshaoyun.liu<br>
<br>
On 2019-07-21 6:59 p.m., Gustavo A. R. Silva wrote:<br>
&gt; Add missing break statement in order to prevent the code from falling<=
br>
&gt; through to case KFD_MQD_TYPE_COMPUTE.<br>
&gt;<br>
&gt; This bug was found thanks to the ongoing efforts to enable<br>
&gt; -Wimplicit-fallthrough.<br>
&gt;<br>
&gt; Fixes: 14328aa58ce5 (&quot;drm/amdkfd: Add navi10 support to amdkfd. (=
v3)&quot;)<br>
&gt; Cc: stable@vger.kernel.org<br>
&gt; Signed-off-by: Gustavo A. R. Silva &lt;gustavo@embeddedor.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c | 1 &#43;=
<br>
&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(&#43;)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/driver=
s/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c<br>
&gt; index 4f8a6ffc5775..1d8b13ad46f9 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c<br>
&gt; @@ -430,6 &#43;430,7 @@ struct mqd_manager *mqd_manager_init_v10(enum =
KFD_MQD_TYPE type,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (type) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case KFD_MQD_TYPE_CP:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; pr_debug(&quot;%s@%i\n&quot;, __func__, __LINE__);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case KFD_MQD_TYPE_COMPUTE:<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; pr_debug(&quot;%s@%i\n&quot;, __func__, __LINE__);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; mqd-&gt;allocate_mqd =3D allocate_mqd;<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18098741A081711936563597F7C40BN6PR12MB1809namp_--

--===============1919131890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1919131890==--
