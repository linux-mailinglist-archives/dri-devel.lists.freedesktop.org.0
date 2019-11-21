Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD534104E9B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5846EBD7;
	Thu, 21 Nov 2019 08:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730082.outbound.protection.outlook.com [40.107.73.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6CC6EBD7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 08:58:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRpk1Y77cjeInA3yCqMzjUS/1POI1+EGEQUfMehu0wBn9Ct5cC7I6VcI/HG/5ocheQiqERLiDqX/QKonZkqZeoEMDRzbj7r/te5jpP/S7Q03mxNpRJL8FUu9uT2i+kRn6o3Rr92QNIq5W8rMc5PYX+gx2Ms8f5G/AEz6yNNXDY6kSSfH2kugDg2ak8gxQUQrdgU8OeG/LdOdN8aAbnRkyiey8BDvgPRQ3Cg1zxMhSRzaSlNGIwSrijCzXMZFmWUB6NtSnRsZjTa7FelWpjh//SgrM1fomnUj9I5yjt/ybBhlPCqKKljMi//+3aoSQqsPfroc2e9z+a1+7DSlUoeO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyU5DTi6oU+4U6w7d/A9ooFonV8J8j54/nuIalHlrb4=;
 b=nGDUdIUEVwf57/Lbi5w1eSF40nh5FaNb9uFz/jxjtaeqcmfV0BFZWTkZoIzHaI32GhifocJUY3ZB2ss8ofzrBIdU2FoIozigkf+A30G5KTYdaTaZQgpAZitomc8F4P/QdRKbDXObp903bpWTR9U+iNS84VssFCgh2Jy8/9dhTzxHbyGWwOICa8QRDuzaiIOCQVJGK86LF+hP40Z4gPIcDCWfLDIeXj3TYYsEWK32hiWKYP1Xed3WhhypC1Vfckugt0DKamlKmvSjbN/HojoKjpKS7tJycb5u+gPCyESEth8OAa/SeJRdGwihEuBPEj8E1rbWDOcUTzmvJOTPN+OhdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3597.namprd12.prod.outlook.com (20.178.243.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Thu, 21 Nov 2019 08:58:30 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::3db4:a949:8b89:33be]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::3db4:a949:8b89:33be%7]) with mapi id 15.20.2451.031; Thu, 21 Nov 2019
 08:58:30 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dave Airlie
 <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Thread-Topic: linux-next: build failure after merge of the tip tree
Thread-Index: AQHVoEm7CU2AwoTvnE6hvvW4HB+iWw==
Date: Thu, 21 Nov 2019 08:58:30 +0000
Message-ID: <MN2PR12MB32960F9FAC005F972CB0F0DAA24E0@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 804cd152-82fb-4f09-1687-08d76e60fb22
x-ms-traffictypediagnostic: MN2PR12MB3597:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB35977AC24CFB15843A3D6226A24E0@MN2PR12MB3597.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:459;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(199004)(189003)(53754006)(102836004)(256004)(76116006)(316002)(66946007)(478600001)(8936002)(14444005)(8676002)(91956017)(64756008)(66446008)(66556008)(5660300002)(81166006)(86362001)(66476007)(105004)(25786009)(81156014)(71200400001)(71190400001)(3846002)(74316002)(7696005)(4326008)(186003)(33656002)(99286004)(7736002)(52536014)(26005)(54896002)(110136005)(55016002)(6116002)(66066001)(19627405001)(14454004)(54906003)(229853002)(6436002)(9686003)(53546011)(6246003)(6506007)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3597;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o7h4iaBHSYtthmrByInIqm63eI8DM6AcWFVr5td9PsdYN+/s+3m2dLfGCje1ZLo9Bcfg5Rnrae7TJ5Ndhg8jod/ADlyfFBuyMeUPSKiPq678HgtLnA6Yek/H6gqH2oQPa7w+Ut5stDPxqp+qoUIdq53VNx8J0Hm6tKhkCWTj08ArqYSw+ErchGpLR70YdXdCgZrltTKbYVYm8HOXDlPOAOz6tnlCNRIhTZ2UtbJ7+XNan0x6sA+6tWyv8upQV1Cmf6NHaRfL2dNYJYcT3bxSLISIaMfQGVC9WpAH0WcGJUzer0ULSA2u0y9CeVrpRT+QWOJ7DzmmuvWL1kmFU1XyFKoS28x25xYrLS5H/CQ4e1aa9SxirGU81/TWzNKY3vAc/Kmexv18xfN9isMDrZa3ODIovBqiXzeM4Yla1Wx9VdZbzCkkJV9xvnsDRtBRxvv6
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 804cd152-82fb-4f09-1687-08d76e60fb22
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 08:58:30.3816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fidtO+F61EoIJQoSprn47alu8LFd6p7CdJO3Uq/YQIp/rsJmbY9HPkEP5HxYWSmB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3597
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyU5DTi6oU+4U6w7d/A9ooFonV8J8j54/nuIalHlrb4=;
 b=NCn9gfRuMfbQMgUyAHVNfBNZRRkRSJ9lVx6QIxemSB/tbTUIda5VBo4bQM2nQVJTS31TFlHYOzDA1NMQ50JI3jdrfi3nLitN4tktvbh+l+ZsiHmGJ3REMZkJga6/IEC1z4+byEYgnWdSXUQ0kKKsjud+t6KANwX+sauWbXSEXR8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1680052384=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1680052384==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32960F9FAC005F972CB0F0DAA24E0MN2PR12MB3296namp_"

--_000_MN2PR12MB32960F9FAC005F972CB0F0DAA24E0MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

sure, this is a issue.
but it wiil build succesed on local drm-next branch.
and you can submit this patch to fix this issue.
thanks.

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
________________________________
From: Stephen Rothwell
Sent: Thursday, November 21, 2019 11:54 AM
To: Thomas Gleixner; Ingo Molnar; H. Peter Anvin; Peter Zijlstra; Dave Airl=
ie; DRI
Cc: Linux Next Mailing List; Linux Kernel Mailing List; Wang, Kevin(Yang); =
Deucher, Alexander
Subject: linux-next: build failure after merge of the tip tree

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/trace/define_trace.h:102,
                 from drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:502,
                 from drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.c:29:
include/trace/../../drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:476:52: error=
: expected expression before ';' token
  476 |         __string(ring, sched_job->base.sched->name);
      |                                                    ^
include/trace/trace_events.h:435:2: note: in definition of macro 'DECLARE_E=
VENT_CLASS'
  435 |  tstruct        \
      |  ^~~~~~~
include/trace/trace_events.h:77:9: note: in expansion of macro 'PARAMS'
   77 |         PARAMS(tstruct),         \
      |         ^~~~~~
include/trace/../../drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:472:1: note: =
in expansion of macro 'TRACE_EVENT'
  472 | TRACE_EVENT(amdgpu_ib_pipe_sync,
      | ^~~~~~~~~~~
include/trace/../../drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:475:6: note: =
in expansion of macro 'TP_STRUCT__entry'
  475 |      TP_STRUCT__entry(
      |      ^~~~~~~~~~~~~~~~

Caused by commit

  2c2fdb8bca29 ("drm/amdgpu: fix amdgpu trace event print string format err=
or")

from the drm tree interacting with commit

  60fdad00827c ("ftrace: Rework event_create_dir()")

from the tip tree.

I have added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 21 Nov 2019 14:46:00 +1100
Subject: [PATCH] merge fix for "ftrace: Rework event_create_dir()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_trace.h
index f940526c5889..63e734a125fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -473,7 +473,7 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
             TP_PROTO(struct amdgpu_job *sched_job, struct dma_fence *fence=
),
             TP_ARGS(sched_job, fence),
             TP_STRUCT__entry(
-                            __string(ring, sched_job->base.sched->name);
+                            __string(ring, sched_job->base.sched->name)
                              __field(uint64_t, id)
                              __field(struct dma_fence *, fence)
                              __field(uint64_t, ctx)
--
2.23.0

--
Cheers,
Stephen Rothwell

--_000_MN2PR12MB32960F9FAC005F972CB0F0DAA24E0MN2PR12MB3296namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
sure, this is a issue.<br>
but it wiil build succesed on local drm-next branch.<br>
and you can submit this patch to fix this issue.<br>
thanks.<br>
<br>
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>From:</b> Stephen Rothwell<br>
<b>Sent:</b> Thursday, November 21, 2019 11:54 AM<br>
<b>To:</b> Thomas Gleixner; Ingo Molnar; H. Peter Anvin; Peter Zijlstra; Da=
ve Airlie; DRI<br>
<b>Cc:</b> Linux Next Mailing List; Linux Kernel Mailing List; Wang, Kevin(=
Yang); Deucher, Alexander<br>
<b>Subject:</b> linux-next: build failure after merge of the tip tree
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi all,<br>
<br>
After merging the tip tree, today's linux-next build (x86_64 allmodconfig)<=
br>
failed like this:<br>
<br>
In file included from include/trace/define_trace.h:102,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:502,<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.c=
:29:<br>
include/trace/../../drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:476:52: error=
: expected expression before ';' token<br>
&nbsp; 476 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __string(ring,=
 sched_job-&gt;base.sched-&gt;name);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^<br>
include/trace/trace_events.h:435:2: note: in definition of macro 'DECLARE_E=
VENT_CLASS'<br>
&nbsp; 435 |&nbsp; tstruct&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; ^~~~~~~<br>
include/trace/trace_events.h:77:9: note: in expansion of macro 'PARAMS'<br>
&nbsp;&nbsp; 77 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PARAMS(ts=
truct),&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ^~~~~~<br>
include/trace/../../drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:472:1: note: =
in expansion of macro 'TRACE_EVENT'<br>
&nbsp; 472 | TRACE_EVENT(amdgpu_ib_pipe_sync,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ^~~~~~~~~~~<br>
include/trace/../../drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:475:6: note: =
in expansion of macro 'TP_STRUCT__entry'<br>
&nbsp; 475 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP_STRUCT__entry(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~=
~~~~<br>
<br>
Caused by commit<br>
<br>
&nbsp; 2c2fdb8bca29 (&quot;drm/amdgpu: fix amdgpu trace event print string =
format error&quot;)<br>
<br>
from the drm tree interacting with commit<br>
<br>
&nbsp; 60fdad00827c (&quot;ftrace: Rework event_create_dir()&quot;)<br>
<br>
from the tip tree.<br>
<br>
I have added the following merge fix patch:<br>
<br>
From: Stephen Rothwell &lt;sfr@canb.auug.org.au&gt;<br>
Date: Thu, 21 Nov 2019 14:46:00 &#43;1100<br>
Subject: [PATCH] merge fix for &quot;ftrace: Rework event_create_dir()&quot=
;<br>
<br>
Signed-off-by: Stephen Rothwell &lt;sfr@canb.auug.org.au&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_trace.h<br>
index f940526c5889..63e734a125fb 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h<br>
@@ -473,7 &#43;473,7 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP=
_PROTO(struct amdgpu_job *sched_job, struct dma_fence *fence),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP=
_ARGS(sched_job, fence),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP=
_STRUCT__entry(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; __string(ring, sched_job-&gt;base.sched-&gt;name);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; __string(ring, sched_job-&gt;base.sched-&gt;name)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; __field(uint64_t, id)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; __field(struct dma_fence *, fence)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; __field(uint64_t, ctx)<br>
-- <br>
2.23.0<br>
<br>
-- <br>
Cheers,<br>
Stephen Rothwell<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB32960F9FAC005F972CB0F0DAA24E0MN2PR12MB3296namp_--

--===============1680052384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1680052384==--
