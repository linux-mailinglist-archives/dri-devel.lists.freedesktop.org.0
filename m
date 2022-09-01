Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2860C5A9A87
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 16:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C001D10E731;
	Thu,  1 Sep 2022 14:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D567610E72D;
 Thu,  1 Sep 2022 14:38:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAA+yusawO3dX+M+mK19hI4/u/6ACYNpa/i5UvnfNmNMStzXUHHyQ/IbeP6UEHmNXv0ELQHjEqNnV4BncBKGd0NKgwNXtlQiKpCPlj+o+xwX6DreHS1untuE00i9W+GeM4XNoevoU7bCix6KpJnKUlSzoWDW+/Dhb11bK6NgxsrcY93uvV18D1T+XUnjMN+sDYdwXZEJ3zEiKBJiZEHnAaUow50+HmXoOk5XEyw57MEwsnbp40HdCCKc7pfpFugPiVkN6tocJQwVjLKivREcRgOj+pkRsoDuagbohkhW9fPh42m0JsZNNjAKpYYHbyIVItCQiQ/HSzGOou6Gx+zzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaMwsv6SSIXGpdgSam02M1jziAanotWZr+7PGt3WPmE=;
 b=XItiI34oyAVliQFeUl+pnUh+UFwmcbFw7rHJZE7Tp7n66GuZVrZeIRS317uC3lpDGPLSsbyG+Jcu03FtV49BFAMAkEOKjhMaukfk37vBgk87zTmyRqsn79YuGSVvuiY/6YhVtflvvl7cFiC/MkVzvJi699g4BlGfvA81SSw0N2H0RocKErUNaG+GGJLpqojmeBMWBN5sj8N+vV8uOG+FekfWmD2r3u61iiYxeTcDdd4wmNOK+RUx4MTdJTPDbw6598ysnUrTFw8I+b49u8MT4H2MGyR6SBoZvaJ2PnapccCKMIMJdOE0HCZTCKsYaXMwhEAw3RQYW/s5HjMCtK8s1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaMwsv6SSIXGpdgSam02M1jziAanotWZr+7PGt3WPmE=;
 b=X/IHXpIOwIVYHrim32jVT/EwUwcMje3Dhm6aoHB3BXhWbdK0pHQ74vYHTaSqkcuZ+Il9cstMrEu0YqMJrAUVAqAwaXAOpFUHTE5RlfmZkVM8rEj/CxhbuC21uBjDKcDg7xDkX+b7WcCn7SvwXyQgtKEEDvhQEvFtpafTM9QZNaE=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by SA1PR12MB5616.namprd12.prod.outlook.com (2603:10b6:806:22a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 14:38:22 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::2428:2f57:b85c:757f]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::2428:2f57:b85c:757f%7]) with mapi id 15.20.5588.012; Thu, 1 Sep 2022
 14:38:22 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/amd/display: fix indentation in
 commit_planes_for_stream()
Thread-Topic: [PATCH v2] drm/amd/display: fix indentation in
 commit_planes_for_stream()
Thread-Index: AQHYvg1DAc0T9idaakuSv8qVErP9j63KpMLx
Date: Thu, 1 Sep 2022 14:38:22 +0000
Message-ID: <BL1PR12MB5144B24F11DE70E9E346D565F77B9@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20220901141511.50523-1-hamza.mahfooz@amd.com>
In-Reply-To: <20220901141511.50523-1-hamza.mahfooz@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-09-01T14:38:21.816Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30b09171-3e84-42f8-fc39-08da8c279ee4
x-ms-traffictypediagnostic: SA1PR12MB5616:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0ySEg+fm+ri0gsfmGqM4S4bJ3VQVrdVZ8mb0k3mjywgp73sXXZ4R9V+/7CCSjhc36eWiaA/LpzSFpWi5a9pxk+tUcJHaXrDy2wsgYwssswd1rD4mtNa5jEqwFGDI+vxydNL/s3EKFvNXMsUK+G/XJMKPeiYOgVHq9GaP3blDygnEruKFCzxZ3XvejWinWhHMQmjj6RcPkZRgpWNUwZtCPWKq3DF87mfguUS4/LlX3LV9i/tvCJ7B2CbKct1kT3oXciqAfa9FOOWr9oC00IebDZhppTHYjI+PfT4yCsywuId2iNe9aWhA+ISqja1A0906pIG5g3Q0mLRspiWF0YTFft60WS3qnj3KC/p0JxRmNqt2JRtgRFFJGF6ZAOj37rzgkcGIdlN2WeUnnyY2kWjYoYgYCgjUH43yfI2fiALb/abgHJOx8Zgz2xCEX78bE10a1f3BHlwqMR9VIPdoPqSPkfzNm2E4GcMXuOTnR3auauoLzlLHRSlMoUcp/XDf3i41N+4DMVj+SH0DBv3wBcF2vMsJGsC0kSR+//psX050Nbb1kyOn0w+CFqeXmVMKz6JCYqQn4LbHHphcCP/pBWPKjjSiBYvQmZDGoIiBVlBxn84T2TvXDKF0byDvlZ68xYs8WlWYQXfGnrbN2KmjiuRVSquD+2xBIZAyE9DvbNf0p1Qd/0D/H5ZaB5O+q/oDkUfxSXou7RH831FwGwjvIB3L9SLIxNjmK2z6+AVeDIgJ5JxVkwuX+zMVs2C/xinanCdg/2NVu9WAniz508rDukhTJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(5660300002)(86362001)(186003)(52536014)(41300700001)(8936002)(33656002)(7696005)(2906002)(9686003)(53546011)(6506007)(26005)(55016003)(38070700005)(38100700002)(83380400001)(122000001)(54906003)(76116006)(478600001)(66946007)(66556008)(66476007)(8676002)(4326008)(66446008)(316002)(64756008)(110136005)(19627405001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?nQn0GNS4NfDndnU4q55WZ5kmgqbQeP87Wa9UUrb0ioroUzLStywOIxH3?=
 =?Windows-1252?Q?Uju5tApbJWszqEWNhqkukQxajwC5ArFZd9PheW13/hB50K8Xe6/Wtgau?=
 =?Windows-1252?Q?jWxS5JMXY7JLzi/shlzBNbbWkYq7e+PztodDjf6mrfCaUuY9BXwPFGLB?=
 =?Windows-1252?Q?gco2uKP3t8blMeaU7RyBzIRK+QR3cUhcr6iACzbvkd7A00FQW03PM2mK?=
 =?Windows-1252?Q?Q+hBWSsFmoBSawCsBULlkSo5xBBJDpOLe/g8K8JPWdOaH0k2yU+Ndu9k?=
 =?Windows-1252?Q?zkiofgMZCCGWftAJosqAZAf/WW6KMh/1oDh1m45ezDeC/vU2BKHtZMBl?=
 =?Windows-1252?Q?Nb4Ta/HUrMqkzxVcAgiRV8yXkoQJRVwg4S1TN4QkJ2L8A6Qse6Ow5gqD?=
 =?Windows-1252?Q?TFJ25JnzUTIWSTBr9mbhRabFxF7dk0k805b3BVjZiMsShHZ548Lv1XwX?=
 =?Windows-1252?Q?2swr8Jmj9kaf+FrXipyf97lad0k1uycybaQnLKDmh5Y4/B3mlzAbAlEV?=
 =?Windows-1252?Q?/nfhDh7bGsCRyC+ZZwfnLfYfDv3Ejx8Jc5QUwffOycNmi4Kcd68JDa1o?=
 =?Windows-1252?Q?oV6CDOiWUv2gE9kIEhAQERrKujMz4TtTUI8hfO28RUJ3E4SRRUJcX9nO?=
 =?Windows-1252?Q?mFyiRkmFw3xgaTzyPfooeSzhXK4QZ7hjRXzpfJoiq7GbCuXb2RzPUlfG?=
 =?Windows-1252?Q?Zy8YuotPffASarZt4h3/CG6MBdmtESDVYO6Th9vW6r3zKfqvcxkorA+q?=
 =?Windows-1252?Q?8eKcnmPm1iWR5th4UI1YbgiVGg0Hb8b9yg68LiDkqNXx8CeYHUZ4L1IK?=
 =?Windows-1252?Q?cIMM+YQC/Umid+Fh9M/W+W1auoMMd6+X3EmNxPYatYcpavUmt6MRR87n?=
 =?Windows-1252?Q?7lbwH4oc4liyF8QBp1ePsmo2tTxzLWdpKIRV+lPJPhaLe7kL4w9hiJgt?=
 =?Windows-1252?Q?7q/dJHlQznXJaMmbJOofv4Z7tysWXdTKvuQZ2oxyqU8+oA81X91deUph?=
 =?Windows-1252?Q?xoM8PsD1F1CEjZKQLZpNFmzfmMEP5NjqxR2qZJxE1RQEaOeX41e0AkHL?=
 =?Windows-1252?Q?BMV+wuW4OktsgcAv3sscKmAv29RyFGLi+3a69yJPi/vodFnUfEvwnjRF?=
 =?Windows-1252?Q?VZdn7MkfFD7noO26jtoPIG9Z7iX/gE7E2O8TRSx+neJ15hDs83++ElYG?=
 =?Windows-1252?Q?EroaG0FeHtWCFwrwmunGaFhogme0hksR7YSOgTQ05aS0PrV+ZJgOzah5?=
 =?Windows-1252?Q?xHGgPiKteAWSp68z8mERSqmMFCqShPTjSOPsS/q58T2BQXBx876f8Epz?=
 =?Windows-1252?Q?fS0nnj+T6l7et9yRzGKRhEJL4PFjZ2BkCErxpl64E2HY3ZOdvr6S+H0M?=
 =?Windows-1252?Q?i7RI3myDvyNyuIic6UnhjobRBql0jLY5RQOGC5scOD3nKgQ46rF6k+Gv?=
 =?Windows-1252?Q?rT+j3GRAc1P0V7cnuHoyIT8MHItQ/4Kb93Nit3lWnixxXpAo6svMNHcA?=
 =?Windows-1252?Q?bE9O6UVFTnG+xmaR9JCm8Ns16rN17Wm/XHDoq4H8pbcPs/YsaH4qEvZw?=
 =?Windows-1252?Q?mDhKOmKcZfROeX1K92VFd4PLEW731e0K6DPQA0r9L3icJErgk4sQ3/wi?=
 =?Windows-1252?Q?yvU6HvKjRJPmLwkVGdis2/5Gkr2g3qGbgv+urqUXM0YHT3pA31wKusyF?=
 =?Windows-1252?Q?2h97R5pc5oQ=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB5144B24F11DE70E9E346D565F77B9BL1PR12MB5144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b09171-3e84-42f8-fc39-08da8c279ee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 14:38:22.3141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s7SHs3DP2wnfmacwg3yKWcl2wDo49dV4kk7GCbQu/VLEvkNl77jr2HatCh6VPpgFZk6mG2BN/weq2PaOLi8VhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5616
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
Cc: "Aberback, Joshua" <Joshua.Aberback@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Liu, Wenjing" <Wenjing.Liu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "Tam, Samson" <Samson.Tam@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, "Somasundaram,
 Meenakshikumar" <Meenakshikumar.Somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, "Hung, Alex" <Alex.Hung@amd.com>, "Lee,
 Alvin" <Alvin.Lee2@amd.com>, "Leung, Martin" <Martin.Leung@amd.com>, "Lei,
 Jun" <Jun.Lei@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BL1PR12MB5144B24F11DE70E9E346D565F77B9BL1PR12MB5144namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[Public]

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
Sent: Thursday, September 1, 2022 10:15 AM
To: linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
Cc: Mahfooz, Hamza <Hamza.Mahfooz@amd.com>; Wentland, Harry <Harry.Wentland=
@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Siqueira, Rodrigo <Rodr=
igo.Siqueira@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koen=
ig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;=
 David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Kazlausk=
as, Nicholas <Nicholas.Kazlauskas@amd.com>; Lei, Jun <Jun.Lei@amd.com>; Som=
asundaram, Meenakshikumar <Meenakshikumar.Somasundaram@amd.com>; Lee, Alvin=
 <Alvin.Lee2@amd.com>; Leung, Martin <Martin.Leung@amd.com>; Tam, Samson <S=
amson.Tam@amd.com>; Hung, Alex <Alex.Hung@amd.com>; Liu, Wenjing <Wenjing.L=
iu@amd.com>; Aberback, Joshua <Joshua.Aberback@amd.com>; amd-gfx@lists.free=
desktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.or=
g <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/display: fix indentation in commit_planes_for_s=
tream()

Address the following warning:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3508:9: warning: this =
=91if=92 clause does not guard... [-Wmisleading-indentation]
 3508 |         if (update_type !=3D UPDATE_TYPE_FAST)
      |         ^~
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3510:17: note: ...this s=
tatement, but the latter is misleadingly indented as if it were guarded by =
the =91if=92
 3510 |                 if (update_type !=3D UPDATE_TYPE_FAST)
      |                 ^~

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: implement feedback from Alvin
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd=
/display/dc/core/dc.c
index b49237390cce..9860bf38c547 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3507,9 +3507,10 @@ static void commit_planes_for_stream(struct dc *dc,

         if (update_type !=3D UPDATE_TYPE_FAST)
                 dc->hwss.post_unlock_program_front_end(dc, context);
-               if (update_type !=3D UPDATE_TYPE_FAST)
-                       if (dc->hwss.commit_subvp_config)
-                               dc->hwss.commit_subvp_config(dc, context);
+
+       if (update_type !=3D UPDATE_TYPE_FAST)
+               if (dc->hwss.commit_subvp_config)
+                       dc->hwss.commit_subvp_config(dc, context);

         /* Since phantom pipe programming is moved to post_unlock_program_=
front_end,
          * move the SubVP lock to after the phantom pipes have been setup
--
2.37.2


--_000_BL1PR12MB5144B24F11DE70E9E346D565F77B9BL1PR12MB5144namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;" al=
ign=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mahfooz, Hamza &lt;Ha=
mza.Mahfooz@amd.com&gt;<br>
<b>Sent:</b> Thursday, September 1, 2022 10:15 AM<br>
<b>To:</b> linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt=
;<br>
<b>Cc:</b> Mahfooz, Hamza &lt;Hamza.Mahfooz@amd.com&gt;; Wentland, Harry &l=
t;Harry.Wentland@amd.com&gt;; Li, Sun peng (Leo) &lt;Sunpeng.Li@amd.com&gt;=
; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; Deucher, Alexander &l=
t;Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd=
.com&gt;;
 Pan, Xinhui &lt;Xinhui.Pan@amd.com&gt;; David Airlie &lt;airlied@linux.ie&=
gt;; Daniel Vetter &lt;daniel@ffwll.ch&gt;; Kazlauskas, Nicholas &lt;Nichol=
as.Kazlauskas@amd.com&gt;; Lei, Jun &lt;Jun.Lei@amd.com&gt;; Somasundaram, =
Meenakshikumar &lt;Meenakshikumar.Somasundaram@amd.com&gt;; Lee, Alvin
 &lt;Alvin.Lee2@amd.com&gt;; Leung, Martin &lt;Martin.Leung@amd.com&gt;; Ta=
m, Samson &lt;Samson.Tam@amd.com&gt;; Hung, Alex &lt;Alex.Hung@amd.com&gt;;=
 Liu, Wenjing &lt;Wenjing.Liu@amd.com&gt;; Aberback, Joshua &lt;Joshua.Aber=
back@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedeskt=
op.org&gt;;
 dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;<br=
>
<b>Subject:</b> [PATCH v2] drm/amd/display: fix indentation in commit_plane=
s_for_stream()</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Address the following warning:<br>
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3508:9: warning: this =
=91if=92 clause does not guard... [-Wmisleading-indentation]<br>
&nbsp;3508 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (update_typ=
e !=3D UPDATE_TYPE_FAST)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ^~<br>
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3510:17: note: ...this s=
tatement, but the latter is misleadingly indented as if it were guarded by =
the =91if=92<br>
&nbsp;3510 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (update_type !=3D UPDATE_TYPE_FAST)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~<br>
<br>
Signed-off-by: Hamza Mahfooz &lt;hamza.mahfooz@amd.com&gt;<br>
---<br>
v2: implement feedback from Alvin<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/dc/core/dc.c | 7 ++++---<br>
&nbsp;1 file changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd=
/display/dc/core/dc.c<br>
index b49237390cce..9860bf38c547 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c<br>
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c<br>
@@ -3507,9 +3507,10 @@ static void commit_planes_for_stream(struct dc *dc,<=
br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (update_type !=3D UPDAT=
E_TYPE_FAST)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; dc-&gt;hwss.post_unlock_program_front_end(dc, context=
);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (update_type !=3D UPDATE_TYPE_FAST)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dc-&gt;hwss.=
commit_subvp_config)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc-&gt;hwss.commit_subvp_config(dc, context=
);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (update_type !=3D UPDATE_TYPE_FAST=
)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dc-&gt;hwss.commit_subvp_config)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc-&gt;hwss.comm=
it_subvp_config(dc, context);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Since phantom pipe prog=
ramming is moved to post_unlock_program_front_end,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * move the SubVP loc=
k to after the phantom pipes have been setup<br>
-- <br>
2.37.2<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BL1PR12MB5144B24F11DE70E9E346D565F77B9BL1PR12MB5144namp_--
