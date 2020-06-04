Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5291EEAC0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 21:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DCC6E56A;
	Thu,  4 Jun 2020 19:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9894E6E56A;
 Thu,  4 Jun 2020 19:00:30 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7F5DD40081;
 Thu,  4 Jun 2020 19:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591297230; bh=AdOKv0qCJJwAzSSLMvMIMrYKhquOJxTFYWtQ16ncsMI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=TmaCr+iPsmVHQRff74quXkpAj+H9m+AOd6EaVh12vTUMJzHrWvxFrPtp2y+fDnjdA
 oHdfSFgGvld/sxGP8VJ/GKoGHcX03zePhZ8qRJDPZSFEvfLu9ZAF9Kl2l+X0/9m+md
 hzD9QZM0pG1Uoi07KQ4A43/27OoieMjfEjvM3otXGRH0ijTnIwyYpYuDaqKlyiyIcP
 gU0k2I2TtYx0LtmKy5unxv6DMqWLTruKImrq4E6vOHesril2DBy+hNZZ1KgOm6+WK8
 4kdWHgApBkU2hAeGNyKvKyUl0SIxD7wobDiYm0he0Hl/3em5CY/t27lTtoDYSnonMU
 hGB/ZQfSt7FAA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6E35DA0067;
 Thu,  4 Jun 2020 19:00:26 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 4 Jun 2020 12:00:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 4 Jun 2020 12:00:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YE4HoBo7ERGfdGO/xXcLZ82VhTfnsEINjYqzBFLpljsokSUC38KBGZagktWPlh2I3+IU1hIO0i+L5uqlRJuo1IA+kl3LpkO+MCpjVNy22y4gWeM2KFHz+dO/xs1Y53sfmDzzScAfQ91ptQnyXbykb9BWPYi3bwO96JgooCXLbaztoxxJ33yh+U8uTTCn1K02SHl3yYU2iyKTjAnhN1HlCxJuy8ClJMbzIMejm4y7mUE868f4ssODkhqynvwvm05EPoKmtoaF/FPDiUKYgXPXIVc+0IwADTkq23+fmrcxyYHXjEondW4660qT9TYSGXZomTiUwwAAXJWZ0aWPP0ogZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/nRdAb84s0y1ApZw6gpCSj5OvPl+p39llyrisyK5n4=;
 b=kxPtzcXPdezWFJDqbzMn7sZdDgADrKwOr2icupTOaoWqyPb3AUsSCZAM95E4PeohYflkR7V5pZy0yYNqEibbO6nFiUW6QEKMLCOEnfou9nMrvFmvJdCtuK0xt9Z84z0LRSIOteIazP5NY3OARoUgefzHPf4k4vk6xckoQXCWXGBLe9ZTFzLIjNEgRnahY9q2CA6TKiX0gBYrDN1dbE+mY7KihUyg6erjUCxJaRjtjuR9kG2+Glsk/DrW20cEu4EeRiWAZjWEIum8s+oqedOswj2SB4BWDewT//9BiO8CRbFBoclUC+1xWxDa/oF2cv6Ky5nPekSH4bfT0EugXy9GDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/nRdAb84s0y1ApZw6gpCSj5OvPl+p39llyrisyK5n4=;
 b=CVOH7Rfixe5BGU6t4ZehELDcHwhRRWWILCfR09kzA4AtZ+2eeZIYMyzWyFdhutRvcqgJ7iOdo0mPT5p5jGIPO80Zy0P+3I9BqI3xN3wPrmWNSFKROpubtuj2Xy6xya/k/lpELCZOaDYgtZcP2uWZsArVSo3MnRK67qizK97yVs0=
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 (2603:10b6:910:1a::19) by CY4PR1201MB2487.namprd12.prod.outlook.com
 (2603:10b6:903:d0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 4 Jun
 2020 19:00:22 +0000
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::b1bf:dda1:dd1e:8e30]) by CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::b1bf:dda1:dd1e:8e30%5]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 19:00:21 +0000
X-SNPS-Relay: synopsys.com
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
Thread-Topic: [PATCH 53/59] drm/arc: Move to drm/tiny
Thread-Index: AQHWEvlb5mSQq60T60WU0QolrVlsW6h57yoAgAAle+CAAAXvgIAUjIQAgA+y2qCAAEc8gIApxpeAgAAoHHCAAA47AIAAexxT
Date: Thu, 4 Jun 2020 19:00:21 +0000
Message-ID: <CY4PR1201MB013642EB94E07AED91813A5FDE890@CY4PR1201MB0136.namprd12.prod.outlook.com>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-54-daniel.vetter@ffwll.ch>
 <20200415094512.GA30444@ravnborg.org>
 <MWHPR12MB14532DA5713E3B579ABFE1F4A1DB0@MWHPR12MB1453.namprd12.prod.outlook.com>
 <CAKMK7uGDGgt8Cm_bFoyzeoP2CWyiUNdUwb7GL6Ohu3k0rP0p1w@mail.gmail.com>
 <20200428140842.GL3456981@phenom.ffwll.local>
 <CH2PR12MB3894B40C6D71435D3E759A34A1A20@CH2PR12MB3894.namprd12.prod.outlook.com>
 <CAKMK7uFRt14m24ajYygdRZz=fUMhA9u6=590R2jjhXGq=VtwNA@mail.gmail.com>
 <20200604080507.GT20149@phenom.ffwll.local>
 <CY4PR1201MB01363EB95985A2C64ADA6841DE890@CY4PR1201MB0136.namprd12.prod.outlook.com>,
 <CAKMK7uFLvV3=uhfnf=MreKBM==-gzXqx3NrV8KDA2D5sTAn2SQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFLvV3=uhfnf=MreKBM==-gzXqx3NrV8KDA2D5sTAn2SQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 120e2509-0efe-4625-b902-08d808b9882e
x-ms-traffictypediagnostic: CY4PR1201MB2487:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB2487D2C1B7B8A7E8EA161FC9DE890@CY4PR1201MB2487.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 33U9naH+PT0Vjc1xQYfswjmZes5A9u3dwxxR4HNs3AlpMYPK9VX6dra1YOvH3kYu7yWmK7juKCVKU43AY2y00Oeclwky3eneua0+51aGDeanwsnbSjcggpZgoWEfv/jXg3ayUDgZwknEhK2UMoXPGCbf51G3gchbITiGiBuEP/Fkv4fdqr7bG4OIVLfO0qQmb4JfZnpDjHsfUMnPJbUIO1eKezPbbO6uH7zy+pJ7/Dz3jfm4LrOmr2A8a2+bhdU9sEFZYKlkS+DK2jnm9H6VIJm2Gb1JUT89dk2YIopp8EUmqAhjGI5OJmV/Gq6Kd3LNl7EV2S3/PQjy74Jc41KqBHZzIthAnSrIDiFsZStOeQldFRHFwU+YeJ3D7yC9Sk/cOBcTl0JBL900d6Z3/Rqc3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(39860400002)(396003)(346002)(366004)(136003)(2906002)(54906003)(6506007)(53546011)(186003)(4326008)(83080400001)(8936002)(316002)(86362001)(71200400001)(966005)(26005)(8676002)(478600001)(83380400001)(5660300002)(33656002)(55016002)(66476007)(66556008)(64756008)(66446008)(7696005)(6916009)(91956017)(76116006)(66946007)(52536014)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: m3DS3Lz9UlIXhGY4yKbeX6fa+cp0SRasLJPpHepLlEKYVlBd//2j0no0wI8ER4jFmwqBbn3UKx6UsK2zVBreggs4UjSBx+l7sUOOJ0FsHkSxvPTyJ7V21rJ1auaRiQpnTfZwWhP+Aoh1lbD9oyHVjEllweYqj17wfKGy3fxq4E25IwVcDU4Xc+A1RMP3rNlLZVHPUdG9qgGO3SvA5Ge4sT04Enty6DgI/lRhICmebeazVIArdAUim/56DYDDUcF2CJuMT+mFJUlOvucmzda0A+HXz1G5BFbB044KoGltU5vfSSPUCjnALimnpwQX1+Wuc2CcbCht16dbsqDUs/jauf/6O6eL7wXc+AnfS/jIA0ueqn1sqZt81PkZ3ljVqTitNOoFAUCSzFEvwJt0rZFWQDjkhkAVQ8knXuu1ieeRrqsYKF7o5+ZfTHlPjAiYxewQ0WeVSXRegMzja0RWJY66kFmX75oE3TatBLwkMRs4XMykf43sQuaQHLIDLMwIIcSy
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 120e2509-0efe-4625-b902-08d808b9882e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 19:00:21.6611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7fciWcFt6r8WDheHdhG1asiIi5WjGcd6kau7czZf33HSgQ/dBXLhjnjGk1j0wDcG98TMpGVs1gJHq/2ruR2TTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2487
X-OriginatorOrg: synopsys.com
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 DRI  Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 "snps-arc@lists.infradead.org" <snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've tested your change and one issue gone.

However I still see kernel crash (due to invalid read in kernel mode by 0x0 address) on weston stop:
----------------------------------->8-------------------------------------------
Oops
Path: (null)
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.7.0-rc6-01594-g4ceda91a4176-dirty #6
Workqueue: events drm_mode_rmfb_work_fn
Invalid Read @ 0x00000000 by insn @ drm_gem_fb_destroy+0x32/0x130
ECR: 0x00050100 EFA: 0x00000000 ERET: 0x813b9a76
STAT32: 0x80080602 [IE K     ]  BTA: 0x813b9a72
BLK: drm_gem_fb_destroy+0xc0/0x130
 SP: 0x9f055ea4  FP: 0x00000000
LPS: 0x813560ec LPE: 0x813560f0 LPC: 0x00000000
r00: 0x00000000 r01: 0x9f6a6100 r02: 0x00000001
r03: 0x9fd5dde8 r04: 0x810f5de8 r05: 0x00000000
r06: 0x00000000 r07: 0x00000000 r08: 0x000000e1
r09: 0x00000000 r10: 0x00000000 r11: 0x000000e1
r12: 0x813b9b04

Stack Trace:
  drm_gem_fb_destroy+0x32/0x130
  drm_framebuffer_remove+0x1d2/0x358
  drm_mode_rmfb_work_fn+0x28/0x38
  process_one_work+0x19a/0x358
  worker_thread+0x2c4/0x494
  kthread+0xec/0x100
  ret_from_fork+0x18/0x1c
----------------------------------->8-------------------------------------------


The stack traces may vary but always end in drm_gem_fb_destroy:
----------------------------------->8-------------------------------------------
Stack Trace:
  drm_gem_fb_destroy+0x32/0x130
  drm_mode_rmfb+0x10e/0x148
  drm_ioctl_kernel+0x70/0xa0
  drm_ioctl+0x284/0x410
  ksys_ioctl+0xea/0xa3c
  EV_Trap+0xcc/0xd0
----------------------------------->8-------------------------------------------
Stack Trace:
  drm_gem_fb_destroy+0x32/0x130
  drm_fb_release+0x66/0xb0
  drm_file_free.part.11+0x112/0x1bc
  drm_release+0x80/0x120
  __fput+0x98/0x1bc
  task_work_run+0x6e/0xa8
  do_exit+0x2b4/0x7fc
  do_group_exit+0x2a/0x8c
  get_signal+0x9a/0x5f0
  do_signal+0x86/0x23c
  resume_user_mode_begin+0x88/0xd0
----------------------------------->8-------------------------------------------


---
 Eugeniy Paltsev


________________________________________
From: Daniel Vetter <daniel@ffwll.ch>
Sent: Thursday, June 4, 2020 14:19
To: Eugeniy Paltsev
Cc: Intel Graphics Development; DRI Development; Daniel Vetter; Sam Ravnborg; Alexey Brodkin
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny

Hi Eugeniy,

Apologies, somehow I missed your mail. I looked at the code again, and I
think I fumbled something. Does the below diff help to prevent the issues?

Thanks, Daniel


diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 857812f25bec..33d812a5ad7f 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -228,6 +228,9 @@ static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
        struct arcpgu_drm_private *arcpgu;
        struct drm_gem_cma_object *gem;

+       if (!pipe->plane.state->fb)
+               return;
+
        arcpgu = pipe_to_arcpgu_priv(pipe);
        gem = drm_fb_cma_get_gem_obj(pipe->plane.state->fb, 0);
        arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - https://urldefense.com/v3/__http://blog.ffwll.ch__;!!A4F2R9G_pg!P0EvyJfMuDwqbeZmHZM5S9po30QWr4KgGrggRirNfgo7wrRXfnUO-8iq0AA4fQCW2WGPlDc$
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
