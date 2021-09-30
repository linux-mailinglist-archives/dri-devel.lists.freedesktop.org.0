Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D9F41D824
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 12:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3446A6EB68;
	Thu, 30 Sep 2021 10:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628566EB68;
 Thu, 30 Sep 2021 10:54:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLLrZfLIG7YgfpUFXQImbPsqbmhCCT6mvrGFhzQhJuGAIczhxTM+I+gVUFszVOw+IY9oBlQfKldsKA9tNxnnUVYOIzIdeXNDfBDFPOH3gs/fDtnfyIvRYBp6ydIyvS13EaM2cPDtlQZvsKXgMDGYFKbnYPyoe2cEEtPlwvrUN6DaMaql6rY3WzYMRtPgbsvjBN/s+YCEpjAgu+ZvAdnnEmoK4LhLhqeGYaaJd+HSuqEn0j2Fxg3dbc3fXxjSlYYXs9dZWJNbDcX5oRUAl2+nLcvFSVaLgbG5zF4F/dEGBB2nlAZP6iRoWWDw2YbuSYSL5d2vGEju1FGe10PHIpbL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=IBla1INoPlk5B7xx6toCp+Por74sKf46aR34oWcCZ8M=;
 b=ORLbafxtF67fLrNCiqjDzp1hG5IkGyrRDngzxqMGBAb/lrjSRdtEfjJZ4zJPkxTz/u+POWJMADH5H9GgiwB+vs4i0fmj0TzN90DA9MPdZZL4vdPIR72PBNcxLqGR7gH7rLBzi92aZm1tfkHUbINb+ipf9rfsdIVl7XyMLs2oq7Y7k1ItGroSeGfwiscWOqIq1Q+1PiwysSIwrOtORiKP5r463xuVNRO8+Ei14YnROWdXULPA5dPBLPPhRo9DxO1Iq55AGV0IcMffL6afGeXKhiJyhC9X4X0KkwmyDkXdzX4/32mkeAoqnGlWw6/bGqBLL1LG2NsHmmJyVwbFDxmj+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBla1INoPlk5B7xx6toCp+Por74sKf46aR34oWcCZ8M=;
 b=iTEXyNx3VHQcmxJzHtJqd1j/Pou/gIpy6NhRi6WzsLf/6Nx9qCq1nviNNLNImRIbzDlTIQyzVtktS6HxxY/ELV+Se+R3xpvE6AcVf8EqLvZaQujKVXiWyDsxAoot72QlIKYw2LmKU2463gVvfobeIJ9VH0Vx0XJqVwp3tjOmI80=
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW2PR12MB2555.namprd12.prod.outlook.com
 (2603:10b6:907:b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 10:54:38 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4566.017; Thu, 30 Sep
 2021 10:54:37 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Simon Ser <contact@emersion.fr>, Guo Zhengkui <guozhengkui@vivo.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Zhou, Peng Ju"
 <PengJu.Zhou@amd.com>, "Zhang, Bokun" <Bokun.Zhang@amd.com>, "Gao, Likun"
 <Likun.Gao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel@vivo.com" <kernel@vivo.com>
Subject: AW: [PATCH] drm/amdgpu: fix some repeated includings
Thread-Topic: [PATCH] drm/amdgpu: fix some repeated includings
Thread-Index: AQHXtd+o/F8xePYmAEae563u53IS36u8XP+AgAAKC3c=
Date: Thu, 30 Sep 2021 10:54:37 +0000
Message-ID: <MWHPR1201MB0192A47A0290305A461A409483AA9@MWHPR1201MB0192.namprd12.prod.outlook.com>
References: <20210930094239.7435-1-guozhengkui@vivo.com>
 <AGiYadRf5XyGUqLxwu3ykKzfwM2BgZo4yCAaEXdQiYfH2dbyKmipDNrclnI2lZH3HzNh71VBy5QKz3O4fFvQETjTI9hoKzKHjZNBz9ERKI8=@emersion.fr>
In-Reply-To: <AGiYadRf5XyGUqLxwu3ykKzfwM2BgZo4yCAaEXdQiYfH2dbyKmipDNrclnI2lZH3HzNh71VBy5QKz3O4fFvQETjTI9hoKzKHjZNBz9ERKI8=@emersion.fr>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1575d99a-dacf-450b-ee01-08d98400b267
x-ms-traffictypediagnostic: MW2PR12MB2555:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR12MB25550CED6489CECE1EA295EB83AA9@MW2PR12MB2555.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wYY23TMFsCqrXc2GyUCzljwdYFgOC82ZCqlibmCRu0PEquMXiaEJb1wRdFQuY6J8tWkV9lnGUBYPjbyOgHMWa6fJKZ2pxf2x4l96dv5HXckd19d5Cy5yJ1QBv/SnyIqxJ3zJElZPe/34IstGlRWDOrPpvviPfgeIl83n2UA7nii48wnmFK04Lj68IFAMHk124HqJv2HmEQ635o7toDz03WZZ9yJIGw8WMYuDptd65uDH3NV2DsXlah4VT3pRWUDYFVH+xxeECezbl/a6XmUaP2JFRUo+2/mQ0q/Ti9ac+Ra/k6cStSLiZ7+DvXuEEAqyPGqrEHovYC7gcuDJQjzGeYrBgXszLUJSZ8CCSQZsKl/GeXas262VQVCXAD0ctv56GkZHyBHeOFVwNlvsFqKM/XY7YtbW4pxs8EL1+/ievTesyDfoMdvIlz8+6XAig6vL0ANYZO/RZlNuzznq38cHXs+i5vNy+uC3jOtY41tSJ42EjVewcxvA1QHkBwucxvRTAsLq8SBzeAI1lhiGiE/RU7HQ9paAovsQc8Cv/H6FQkYW2CQQi5FcdBeD1lfuHGKq1Na+uFaAXTe0d5pgEIzQJ/fW4xTxWF1MFpImCREw6VM7io68Ax2tGLJvpb0gd2G8eJ93aJG4BXsUU6DBt5TqWz0jM6BWAcim/pMvrTzWJR91bj3WMqthyZMz0hY+rO6PLtMZ0NN0NZhqma7jZMZgGQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(86362001)(7696005)(2906002)(71200400001)(508600001)(5660300002)(186003)(4326008)(66476007)(66556008)(64756008)(66446008)(66946007)(76116006)(38100700002)(91956017)(122000001)(33656002)(54906003)(8936002)(110136005)(316002)(52536014)(8676002)(9686003)(55016002)(4744005)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xOVs1XOAbgafvbwZ+nid+Ol4YzFmadPRbDA/9ahS3KBOc0pJk/4qaBjZXVLn?=
 =?us-ascii?Q?zEDN3K6ZXYgEY3EmXKtkvoP2uqogHnPxpy1dg5UJGJO9Do2cSsrdCie1mnBN?=
 =?us-ascii?Q?M2I4z//axzKp+gwqCE3cl7mxAn7dJcWV1h75gqx8Ms2tAIVGHgKFWbusf1pq?=
 =?us-ascii?Q?xrJ3GB9xAvFlyp1AKsEkT7duGBqK72IRL4ETeBnZekhAPkup24C5F5GaJwIR?=
 =?us-ascii?Q?tDd77aN+YUU0J5+ItJt2X4eh0TD51W9No9TR/vtoemZqwh9HWcKpRSVUpKfh?=
 =?us-ascii?Q?vglGaI6beUjLuKNIWjyrCaDz7qXjUO64dFSr/vstMlVPK9CgHsW7nkp+zVQr?=
 =?us-ascii?Q?f3SOrQwSCipjewiuem7iZVIhfXs2wGdBI/iNYN1zOkVPJJRHkyLkzSwyjcX1?=
 =?us-ascii?Q?sUwl5xt2Q7t0UezE4xX2d9VCccAxgXSDxPUJy96H21AfeD8b/JM20/sPnaVk?=
 =?us-ascii?Q?xAPK8HQ1yTU2bR1JIv0d4Xi8uoh+RTr4TR70CdAY168XVauLhOMbcyxTOT/C?=
 =?us-ascii?Q?KCulZSX590KIBwoCZOXUeyRVvB6z14bliJfJPed6JwWtPZ2iq5az6viITfJC?=
 =?us-ascii?Q?2xtY62cKaujG86jCk+nRVxKbQyux2X1po++HG2pXsR+DyY14Lvw/QcC8PLOb?=
 =?us-ascii?Q?6gfkkbiY8QbOZDpM+PQBSbB1J4wrjqsO+7PNV9uBNZjZRWvhC3ms5Wta17t8?=
 =?us-ascii?Q?o/STX+WRjnG738GoFufDeejcZQbI9ayFuU31gHoP1LD/WBw3TkMEh6US6Wu7?=
 =?us-ascii?Q?RBvjGYINF5P5KmOPTYusLkUqxKzyLvtrrAMWumRh9oqq1SRiV6VrtpHOINDE?=
 =?us-ascii?Q?9QuQB7snLYA13L9s0jlfAwo24582KsYou9C5ddmSIIe8V1HH249uAfLQNN4n?=
 =?us-ascii?Q?AiIK1ubwZ5sBC/ja/8wdjFILAyEPIx4dBFGTTJsNzhTezioyggyLiAmOp68m?=
 =?us-ascii?Q?zqAKA2n8zW66LkVuRI7OePRdCwD0Qj+n/8mRMFxrNm1Z8zdvXDHHadiB37V9?=
 =?us-ascii?Q?2qEzMypSrPR8HSQF6UFoQ7IvSbEJM63FtfuEzPbfkF2gUXdO0uLrTEzcCuGs?=
 =?us-ascii?Q?YDU5xSOmjA17P+OeyqDiURc8xkKBhAtTFdV8ttUxQw2bneR1LmcpMqUUckD0?=
 =?us-ascii?Q?4jSTFkDfka+OdktWujKZmZ2K+WOfm3QhYRco9FAOBZrnc5BlXC22zIAnJ2Yk?=
 =?us-ascii?Q?oot0Euu9hPnKhvVzGRTNhWwQ3jjN3bbGYbJXgvpzCTxqnTDGnVoMmw8UH/DC?=
 =?us-ascii?Q?g602LhzZJmNupop1vHmJZrKBkruczcvBkvaIgwVj5tiVUMFLAFPHTtt3sDF7?=
 =?us-ascii?Q?Zn4W/8MRYxjM/h2lti6VkLrDa1XMG9cWzZeI2PZhBTiiED/jXRYkEaU0nNSA?=
 =?us-ascii?Q?fIfxuAc=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MWHPR1201MB0192A47A0290305A461A409483AA9MWHPR1201MB0192_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1575d99a-dacf-450b-ee01-08d98400b267
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 10:54:37.4249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQOpcMutma7Vvkb4nRJoWbxfO36qZICXUwrF5/fMow0zceh/TEAd6lxsUPhYFeuB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2555
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

--_000_MWHPR1201MB0192A47A0290305A461A409483AA9MWHPR1201MB0192_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Seconded, there is one include for each hardware version.

At least of hand I don't see a duplicate.
________________________________
Von: Simon Ser <contact@emersion.fr>
Gesendet: Donnerstag, 30. September 2021 12:17
An: Guo Zhengkui <guozhengkui@vivo.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <airl=
ied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Chen, Guchun <Guchun.Chen@a=
md.com>; Zhou, Peng Ju <PengJu.Zhou@amd.com>; Zhang, Bokun <Bokun.Zhang@amd=
.com>; Gao, Likun <Likun.Gao@amd.com>; amd-gfx@lists.freedesktop.org <amd-g=
fx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists=
.freedesktop.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.o=
rg>; kernel@vivo.com <kernel@vivo.com>
Betreff: Re: [PATCH] drm/amdgpu: fix some repeated includings

One include is v2, the other is v3, or am I missing something?

--_000_MWHPR1201MB0192A47A0290305A461A409483AA9MWHPR1201MB0192_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div>Seconded, there is one include for each hardware version.</div>
<div><br>
</div>
<div>At least of hand I don't see a duplicate.</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> Simon Ser &lt;contact@=
emersion.fr&gt;<br>
<b>Gesendet:</b> Donnerstag, 30. September 2021 12:17<br>
<b>An:</b> Guo Zhengkui &lt;guozhengkui@vivo.com&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Ch=
ristian &lt;Christian.Koenig@amd.com&gt;; Pan, Xinhui &lt;Xinhui.Pan@amd.co=
m&gt;; David Airlie &lt;airlied@linux.ie&gt;; Daniel Vetter &lt;daniel@ffwl=
l.ch&gt;; Chen, Guchun &lt;Guchun.Chen@amd.com&gt;; Zhou, Peng Ju &lt;PengJ=
u.Zhou@amd.com&gt;;
 Zhang, Bokun &lt;Bokun.Zhang@amd.com&gt;; Gao, Likun &lt;Likun.Gao@amd.com=
&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; =
dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; li=
nux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;;
 kernel@vivo.com &lt;kernel@vivo.com&gt;<br>
<b>Betreff:</b> Re: [PATCH] drm/amdgpu: fix some repeated includings</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">One include is v2, the other is v3, or am I missin=
g something?<br>
</div>
</span></font></div>
</body>
</html>

--_000_MWHPR1201MB0192A47A0290305A461A409483AA9MWHPR1201MB0192_--
