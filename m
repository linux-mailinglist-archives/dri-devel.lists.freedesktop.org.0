Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F45A267909
	for <lists+dri-devel@lfdr.de>; Sat, 12 Sep 2020 11:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E416E0FC;
	Sat, 12 Sep 2020 09:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25866E0E7;
 Sat, 12 Sep 2020 09:04:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOrwi0CMk5u9A3egxBcnYfF9tnDICIF+fRWLOxFzZV6PvXf5pq+lkp1R6wFTy1V2ajjOg9uX8+fqzyFyNlxqYWaFzvLk+p4omknlSZuN/z+gLssIOJ64pDuDFvYDRg9+K/BCymyxDvHmnU/XUqNCSsSf8iIRCxU60jfNY8HDZMZgtGfUv4qTtUnOFvKQkgnhfhmTo+aSQjCUgIc+IkgCJeNhQTuPOiVRRcjHqrSoz51Q764F7riyIIvVrspYNZVUmUIcSlgUuRIzK2XaSXo42zZAxX9HMfC8OWw9Qzp2NxfxjIjRBVfJLLYmtYdr1dBvIMSUy45Cg0hwnz12Fv3lcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvM8JYWUx7+rTu87KfvD1BOFw2jxjVdcyHatHZJOHHA=;
 b=bTR0a5JypQ1OKbMmxCSkVpy3qOrhBU2uE+qYf88EJyewGvmwsnj2/zH3JTTVTgWCCuSwqO7Cb8jGPhlANUAO1Ji1uC9T3cAEIk+1WJnTT4zz0jJ0q8N7FQhiXgkxDiNOTeGyR4W9LWUXELO9L9/SCmQ+mLgoi2xv0y1UAZoUEUfW0r49U4rBKNJBLuC3Wc5W8Hb0ioBxTzgKlBvT+0viq50EjaqXi4crHdO3JZIUczfppydiLmXQbgVLX2irnGtZO3PTfLTFPScsu6QL/KZkSWvkK1ZJwl7E3+pcJWKY6Yb7lRR8V7zWnndmg8d/jPFofZgNwI8PX8P4QTFSLNBcWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvM8JYWUx7+rTu87KfvD1BOFw2jxjVdcyHatHZJOHHA=;
 b=VYvRcWc1LLs9rxPQJrFwbn68ukx6eAWw9Crya4LXJbiRvxmyGsznnJt60Ruei67bwl6RkKmXg2oHvrICQZbOD1+whhxwsSvIspOjCbZMtbu9QGMyX/D70tqy6vMYZ5f7SB1nrYR3cH9CiemOQGDlmknGV9Jqhnd+db0tkBH61Po=
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Sat, 12 Sep
 2020 09:04:44 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3370.017; Sat, 12 Sep 2020
 09:04:44 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: first bad commit: [fc8c70526bd30733ea8667adb8b8ffebea30a8ed]
 drm/radeon: Prefer lower feedback dividers
Thread-Topic: first bad commit: [fc8c70526bd30733ea8667adb8b8ffebea30a8ed]
 drm/radeon: Prefer lower feedback dividers
Thread-Index: AQHWiOC4dwo88vBXAUq3jYbo8Hl6i6lktcFO
Date: Sat, 12 Sep 2020 09:04:43 +0000
Message-ID: <ab15688b-f617-464d-bc75-c0dca7d42234@email.android.com>
References: <20200912084255.GB4827@zn.tnic>
In-Reply-To: <20200912084255.GB4827@zn.tnic>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alien8.de; dkim=none (message not signed)
 header.d=none;alien8.de; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2a02:908:1252:fb60:64aa:78c7:af0:5a3a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4cceaceb-67d8-4d7c-92db-08d856fae432
x-ms-traffictypediagnostic: MN2PR12MB4389:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB438914A2788B4C4DCABBBE8F83250@MN2PR12MB4389.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HdZGEtyW6WGcbIqWMaTnxNQQ5j9P9hs4j5qvTL5V71fmxkL9DhLRYla+oSu19XIZlc05BihPY56gf8B2r7xKn1unIinbKKigPl+NGGXY3lwno3Dkw79ERstlbPgQGBP/1OB2M+MfBSNk3SOMaUKO3Sy1kaNXf3Aig5tPThSutYJM8s0/XS/cMoS5u++zCAuJHgGSGuDzfjlQfoPDslUvLUzpWOTlFgfA+hqLhXToem1voZ/W/avi/7vYX7HvcVDPyBtI1wEd+8Q3f5bkOnANp3RtrHWMeNFa5bAPkepvZLWomy0/VsvyldVi2/fQF7QpcLOA5MLirxLSA86XAe3HwJQBWem8/cfybDxwRjfe+7FUzfjD82HuABAc85cJud1/YBVMl0TMGWA80D+T6mHanX/5yRvIc6SpcVDpqLi+UxawEUQWC1Rb4QA8iMOeBj/jEk+lNyiiox/7RzWdtorPQg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(6486002)(478600001)(91956017)(66946007)(4326008)(9686003)(8676002)(45080400002)(76116006)(31696002)(966005)(2906002)(54906003)(6512007)(86362001)(316002)(166002)(6506007)(83380400001)(31686004)(5660300002)(71200400001)(186003)(64756008)(8936002)(66476007)(4744005)(66446008)(66556008)(6916009)(154273002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: S2pMHJyLKbR6Ipn6Jf+gEaX3h6GJ35xTT01GcdYVxi5hjtKHyupERDuyGJI7ZF9qkEY8B8nji1FOljtOldH6MZjWx7jykbq4xINUeZnZwksXX/Gy9W7ApXeFiz//3eYDJlvwR74QFb+tH8Gp39ELbF+NMj0RTxaYUACpcUQIuX19/UV63+7yPbrC2koTl7Kbl7unTulP5q2hphdSh5Y0fiy4OdZkeBpIkF/8MghQ7n2gvuaPbgNIX4ppmriM6j3fMbIyZl+E+CQe6OWe5LwS0qEP6uL9zkaLi6LOX+d2HKPbePpXsIVhUUcSsQwoHmaXM91FnKENgj0jqRQhkKg1MXXxIXyOuyHRSAcXjkaXQN6raHMBb935cx8ruxPUbE66zE/FRqih+kRJr8Bsxzp9Dr66SkLbizI+kO/osnNPl9DpuYRwsAK+iB8QIBXyU0hQG8/GMiPMN1901njF1zUk+qsqjYD9qk1Fi4kVKARfamg/lDu3FAxE2YkOZ0XGvqIPptR1C87wUb2UYIS5ZukQG1eiZgmsvDs9l4WKB3r3+/inv6gmS0zJGYVg/QdKDS5dyA3Gdk8TWAQb2j3qyCOLdS/oouxJnYxYRHw+XLlfUMFDS4SeGKEVKlZV51ljgsJBdpMFc7r01MFBmQwjUMgECo6pCAsmN1wp3EnssqFDObZPbJsC5zosLPVzUBjVEj51spQKBX41o6wgId7C5kW+lQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cceaceb-67d8-4d7c-92db-08d856fae432
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2020 09:04:44.0489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n+75sEqy8JcFT8HlvhTBcLONYk8k8f9j1+aiU1lOaUacpxEpFuHLCT2tWOzRsOMM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============2104669252=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2104669252==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_ab15688bf617464dbc75c0dca7d42234emailandroidcom_"

--_000_ab15688bf617464dbc75c0dca7d42234emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, that's a known issue. Patch for the revert is already underway.

Christian.

Am 12.09.2020 10:43 schrieb Borislav Petkov <bp@alien8.de>:
Hi,

this patch breaks X on my box - it is fully responsive and I can log in
into it from another machine but both monitors are black and show this:

"The current input timing is not supported by the monitor display. Please

change your input timing to 1920x1200@60Hz or any other monitor

listed timing as per the monitor specifications."

Reverting it fixes the issue.

Thx.

--
Regards/Gruss,
    Boris.

https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpeople.=
kernel.org%2Ftglx%2Fnotes-about-netiquette&amp;data=3D02%7C01%7Cchristian.k=
oenig%40amd.com%7C23ce888c10c24d32406508d856f7d8b9%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637354969801820970&amp;sdata=3D6l12dRUhk4at8YTDxkxq6DZ=
OcQXuBY77XH4VYF8HjRA%3D&amp;reserved=3D0

--_000_ab15688bf617464dbc75c0dca7d42234emailandroidcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto">Yes, that's a known issue. Patch for the revert is alread=
y underway.
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Christian.</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">Am 12.09.2020 10:43 schrieb Borislav Petkov &l=
t;bp@alien8.de&gt;:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Hi,<br>
<br>
this patch breaks X on my box - it is fully responsive and I can log in<br>
into it from another machine but both monitors are black and show this:<br>
<br>
&quot;The current input timing is not supported by the monitor display. Ple=
ase<br>
<br>
change your input timing to 1920x1200@60Hz or any other monitor<br>
<br>
listed timing as per the monitor specifications.&quot;<br>
<br>
Reverting it fixes the issue.<br>
<br>
Thx.<br>
<br>
-- <br>
Regards/Gruss,<br>
&nbsp;&nbsp;&nbsp; Boris.<br>
<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fpeople.kernel.org%2Ftglx%2Fnotes-about-netiquette&amp;amp;data=3D02%7C0=
1%7Cchristian.koenig%40amd.com%7C23ce888c10c24d32406508d856f7d8b9%7C3dd8961=
fe4884e608e11a82d994e183d%7C0%7C0%7C637354969801820970&amp;amp;sdata=3D6l12=
dRUhk4at8YTDxkxq6DZOcQXuBY77XH4VYF8HjRA%3D&amp;amp;reserved=3D0">https://na=
m11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpeople.kernel.org=
%2Ftglx%2Fnotes-about-netiquette&amp;amp;data=3D02%7C01%7Cchristian.koenig%=
40amd.com%7C23ce888c10c24d32406508d856f7d8b9%7C3dd8961fe4884e608e11a82d994e=
183d%7C0%7C0%7C637354969801820970&amp;amp;sdata=3D6l12dRUhk4at8YTDxkxq6DZOc=
QXuBY77XH4VYF8HjRA%3D&amp;amp;reserved=3D0</a><br>
</div>
</span></font>
</body>
</html>

--_000_ab15688bf617464dbc75c0dca7d42234emailandroidcom_--

--===============2104669252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2104669252==--
