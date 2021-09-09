Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D30405B1D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 18:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DF26E8C1;
	Thu,  9 Sep 2021 16:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8413E6E8C1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 16:43:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKF5BtIPBz+aDk40wJj1AMURueyFmwul/TwyHSzVvu8MqBol9jA+1p5leX0YY0hrtRtYY3pagZVj/vX4fg2TOgTEMvfftdGvwEIZFHJIU1IBaLxkgc2COafF2CpFMEmGdt+I7zUtWJAxBjj1XdOQU02PT25IoAzEqvWLudP51ZCnav1Q0ygi0EKJGtUF1oMJEybdg47FDRDW7Lwe7atGrlCJS6H5jTnd54QWn+/v97QxJPhA131vl3N1wU1xGD4/450Nlo9iwljkH0sG1+a6thm+XDk4RQT6wGL2acIm1pB8K8m7Cqw0pmio4Jrp63O7EhpityKF38AT2AJH7Pt4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=DMDZb6h459Pe/1mWMqi2ycDujWjU9b8P/MHhi1kYWbg=;
 b=d+SLn8SApFxBE96S+yeOYnjwe9YYJjboPYT6XS/mIY9rWRnQ0Brwb4agpxzJ3fseTCrgoz0z/l0MWZ3C38FjUakrjN+QMS1MSA/T80c3wT2extJchnCUqcR5hGQI8NKtqMALPRjA+/bE2O+lc9ebAy8jc5n4swl05jcGnrywPON6hY8vN+zdanPsKUs5to5z2YCC+OCr32/aLfX0hG5LAlp7K3R+l5PQbXu98Auacbgb1ivSynTQJk4bc3V783u9jd4qpnq04ocGzlGoSYG9lek20Mj3WbZhtG9VHLBFHN4losk6xZb/aKM2AdrH+s3alQiqYjht57pzPej3xTOgaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMDZb6h459Pe/1mWMqi2ycDujWjU9b8P/MHhi1kYWbg=;
 b=N34Piwrq+HzbsDMYX8yqMhDVDp8t09DlGeHId220YvCzFb3wubiSMEOFYjg+T3xCg5i/XiJHkeXUkFObjcZ7zLU7nvTQhMKTyjGu9OekrFqaFmGcv4ZIOgR7WwfU/TrkCvBOf7nSztlolz3zRDbL/wiwEhPg+5557taq+d1o2rU=
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 16:43:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4500.015; Thu, 9 Sep 2021
 16:43:22 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Matthew Auld <matthew.william.auld@gmail.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, ML
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: AW: i915 ttm_tt shmem backend
Thread-Topic: i915 ttm_tt shmem backend
Thread-Index: AQHXpYsA2MTFrFLzJEqSCHgvApzGk6ub5vZ9
Date: Thu, 9 Sep 2021 16:43:22 +0000
Message-ID: <MN2PR12MB377560697912FB903C3EA00C83D59@MN2PR12MB3775.namprd12.prod.outlook.com>
References: <CAM0jSHO+vBwJmB=bsYcdjzHFfnaLYSDrPYWNUmEe1BqmrVOBxA@mail.gmail.com>
In-Reply-To: <CAM0jSHO+vBwJmB=bsYcdjzHFfnaLYSDrPYWNUmEe1BqmrVOBxA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bd723d7-8008-40f1-1cd1-08d973b0efad
x-ms-traffictypediagnostic: MN2PR12MB4144:
x-microsoft-antispam-prvs: <MN2PR12MB4144B2A724D721F79694603F83D59@MN2PR12MB4144.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UI8ca/q5552qn1ygl2o6fYAArRi7XmAKRnmwCue1zucaWHOnDQROIKmZoFJRzHJk4QxoSSlnKvIeMa19L5pHP2cYwyoohqqTYzb808zBxNQeMtMD2n8/i0gZfYNbTSLSPhKqjXhm7HhqTVN1+SmPempunu386oJj9PnvA9xxHMf2sV6CkbTaljtgs4sRTtNyXMiIrVUEbjoxM0xZZLNfn61muidoBab7QVfjqOhnd2VI5dRbfnT1x9YJiMLztLZeid8FAwWt5tgoSLDXYd0NhMYy1MVSmGA7AS3FFx4YYAR/Ow5I93949Gd6xaUiUfnMCty1pvJucj8rIN113J9tS078ucGbGqFtBdqKdQNnqSeUhp+P90x+MBft9c9pSNwSQEikhVedzgH4CpPVxyoyLHSZMc0K3wZLLl81jUu0QwcjdB/UaTr5T8TJ6dAXyMrM7eIdfe7syDZu1anRs5R81/9eMkmoG/eDFM9/cPIiTzgl1xK7ueIAehzoFYdx0+K9eqpByNAa+uBDQ8WvNtSQNxf2qiY2t3dkYuHwqf98DwIOFBJoFXmK4OvVYs3lbuZmF2eUzhnBfU4QgOwCQ8dQ3hi1S98ZLNT90/Q1ZQnJ60KL1/aZW84BtZ4cEHC+sJbsGqdQtG6oeMDIpWLAi+Tf9o3Vax6B67EgE3H+M8lRS9gA9ChLUAksYp84Ib+eEvJC0n6wGAVAh6opHpWVFHVkDg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(2906002)(8676002)(5660300002)(71200400001)(122000001)(33656002)(66574015)(4326008)(38100700002)(83380400001)(66476007)(7696005)(316002)(8936002)(66446008)(64756008)(54906003)(76116006)(9686003)(66556008)(86362001)(91956017)(110136005)(52536014)(478600001)(186003)(55016002)(6506007)(66946007)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?TRcUkDxjBdpVtC2lisw7rKphu4WMCIR82cyVxMnRBFdgKYTzCcFZlSo5hh?=
 =?iso-8859-1?Q?ytc9gqmz1xIFmh64k0tx0xK+/JrvrE15prirkTC1zVwYkOXw2yWbjIye8p?=
 =?iso-8859-1?Q?WE2Wx428pB6yFDzxbgV9+E3r2fVxEMI92KHJZK+97k7zukvPQQrO52+FqL?=
 =?iso-8859-1?Q?JR4wO5mJTyW1fHoe1U4kfzVWmrNmEaRP05Vx0VeB51LMjd201dJGTxROeO?=
 =?iso-8859-1?Q?Ge+ducmdlGqsaxK1NIix9RLoDM/1lgIxYgbd9dkOe5IS8snmtBoQmpj2h8?=
 =?iso-8859-1?Q?dH5CWwmpQsOGS9jkLtq7NvN5TEcPwhz1nT0VMOCqMAxQwQUYInvGh0t4eC?=
 =?iso-8859-1?Q?tNF2dRAnRb/T7TehOIgYAsIlAg4OqT15Ax3AcqD2hRSU6tAbOowKhgoJGL?=
 =?iso-8859-1?Q?/oWZ/lUZFDzJCFBfxJ1F04L7Fm+P8N41f6woAJRtax/C/PHmZCTlOMDv97?=
 =?iso-8859-1?Q?u6F/VLID59MfCljzgg5KfxfiYKcxVRBOYRHxLEW9SBltKJMgtd4pXlv9Bz?=
 =?iso-8859-1?Q?E4CCcMfHcZhsB3SUqUBq2Dp1MmwpKSTZQeAvJPQ6l/I3/ToPbf46csfrnR?=
 =?iso-8859-1?Q?QMgf/FUqojNe6LpONEoXLD9OCFOqjHPgQjr3MpVKJwGqxowdL+XyKk/enW?=
 =?iso-8859-1?Q?8gbyvM798zIGuKUqSVv1XyDhmSwE1eeTC14g+tY+sp3zemYngSO2e3oFqM?=
 =?iso-8859-1?Q?qUL40chwXGwqU17NkTpeS3Yc9MIYJclkMnsVqp1EfgmapEmOPgpk7HOI+f?=
 =?iso-8859-1?Q?T7ehQRp9oXQHc3O6dphQJ6PgMH8kz5TbhkQl5Q4dYDFU7wWGcmfQoCQxlL?=
 =?iso-8859-1?Q?M+44uRqsP9d0VluTVq4DhyCzCdN/ibeq/VaSiMLVyMU1pBUk4f256wdxOZ?=
 =?iso-8859-1?Q?yjRz2gTjnC3bk5L39x7bCHGId0ZXYzVUYDNQ+yBukX52+Icp852Dfdsmg7?=
 =?iso-8859-1?Q?BtNfnHw5cwr7EefxghDQXRSp2a+MTJRJANQVRz7JKjuaS2sMDSIG7Gt0W2?=
 =?iso-8859-1?Q?fHjoRpasSDl2HqZWoQAqCxhoKlXR2inju9+9fiv6Xu7DtLl5xq1aL+2zFi?=
 =?iso-8859-1?Q?NXwbaCFHLymO5kiY021J56Y2MuraSZG3jSpAtbpFDv5pt6X+n6HX/ynmES?=
 =?iso-8859-1?Q?YSIeppdUM8dxPHxPDepeeenrM/XadOtNtxTb2/Mn0UK0CSLHAxnSEqKznI?=
 =?iso-8859-1?Q?huKC7Js74TqU/95xhDgYtbCrwTiDvgLOHwAhz9pZO7eoGg9W90Ui+9FI+p?=
 =?iso-8859-1?Q?tmgxKmsXpq0NzU5J8KmIpsXVODYJ2cpNxPZexBKpxJmiebELTSOf7ikfbj?=
 =?iso-8859-1?Q?BOde0rTD3O1xx/4hs+uMN9XgIxOT7UnCkHtiDkRmU0c93b/YrOB5rTp3Sf?=
 =?iso-8859-1?Q?VAndfDs01vqtzW6klASOUD/7N04mO7Oazi2cHKoQoVQtfrnvmVv2s=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR12MB377560697912FB903C3EA00C83D59MN2PR12MB3775namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd723d7-8008-40f1-1cd1-08d973b0efad
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 16:43:22.1164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Abts516A5+WzU7sNxC6MoFr8Je5rIOvW1LR/tdFpiWbBrT4xH9KNFL0BGkec/ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144
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

--_000_MN2PR12MB377560697912FB903C3EA00C83D59MN2PR12MB3775namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

this doesn't work, I've already tried something similar.

TTM uses the reverse lookup functionality when migrating BOs between system=
 and device memory. And that doesn't seem to work with pages from a shmem f=
ile.

Regards,
Christian.

________________________________
Von: Matthew Auld <matthew.william.auld@gmail.com>
Gesendet: Donnerstag, 9. September 2021 16:56
An: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>; Koenig, Christian=
 <Christian.Koenig@amd.com>
Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>; ML dri-devel <dr=
i-devel@lists.freedesktop.org>
Betreff: i915 ttm_tt shmem backend

Hi Christian,

We are looking into using shmem as a ttm_tt backend in i915 for cached
system memory objects. We would also like to make such objects visible
to the i915-gem shrinker, so that they may be swapped out or discarded
when under memory pressure.

One idea for handling this is roughly something like:
- Add a new TTM_PAGE_FLAG_SHMEM flag, or similar.
- Skip the ttm_pages_allocated accounting on such objects, similar to
how FLAG_SG is already handled.
- Skip all the page->mapping and page->index related bits, like in
tt_add_mapping, since it looks like these are set and used by shmem.
Not sure what functionally this might break, but looks like it's maybe
only driver specific?
- Skip calling into ttm_bo_swap_out/in and just have
ttm_populate/unpopulate handle this directly for such objects.
- Make such objects visible to the i915-gem shrinker.

Does this approach look acceptable?

--_000_MN2PR12MB377560697912FB903C3EA00C83D59MN2PR12MB3775namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div>Hi Matthew,</div>
<div><br>
</div>
<div>this doesn't work, I've already tried something similar.</div>
<div><br>
</div>
<div>TTM uses the reverse lookup functionality when migrating BOs between s=
ystem and device memory. And that doesn't seem to work with pages from a sh=
mem file.</div>
<div><br>
</div>
<div>Regards,</div>
<div>Christian.</div>
<div><br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> Matthew Auld &lt;matth=
ew.william.auld@gmail.com&gt;<br>
<b>Gesendet:</b> Donnerstag, 9. September 2021 16:56<br>
<b>An:</b> Christian K=F6nig &lt;ckoenig.leichtzumerken@gmail.com&gt;; Koen=
ig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Cc:</b> Thomas Hellstr=F6m &lt;thomas.hellstrom@linux.intel.com&gt;; ML =
dri-devel &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Betreff:</b> i915 ttm_tt shmem backend</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Christian,<br>
<br>
We are looking into using shmem as a ttm_tt backend in i915 for cached<br>
system memory objects. We would also like to make such objects visible<br>
to the i915-gem shrinker, so that they may be swapped out or discarded<br>
when under memory pressure.<br>
<br>
One idea for handling this is roughly something like:<br>
- Add a new TTM_PAGE_FLAG_SHMEM flag, or similar.<br>
- Skip the ttm_pages_allocated accounting on such objects, similar to<br>
how FLAG_SG is already handled.<br>
- Skip all the page-&gt;mapping and page-&gt;index related bits, like in<br=
>
tt_add_mapping, since it looks like these are set and used by shmem.<br>
Not sure what functionally this might break, but looks like it's maybe<br>
only driver specific?<br>
- Skip calling into ttm_bo_swap_out/in and just have<br>
ttm_populate/unpopulate handle this directly for such objects.<br>
- Make such objects visible to the i915-gem shrinker.<br>
<br>
Does this approach look acceptable?<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB377560697912FB903C3EA00C83D59MN2PR12MB3775namp_--
