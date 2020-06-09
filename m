Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593721F3A64
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 14:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FBC89F41;
	Tue,  9 Jun 2020 12:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5CF89EFF;
 Tue,  9 Jun 2020 12:08:28 +0000 (UTC)
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DDD10C03B4;
 Tue,  9 Jun 2020 12:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591704508; bh=dbEE7GzfSwi+HrT2VZ+ofhqGb/3sRQKM5eWMO25+ji8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=A5oS+p17UtQMKDTxFxK7li0NodPz+S90ID7FJfbMzacuxc76fN0x1SnZOJvKwm4vb
 JTMcp7WqyEnlz78GppiWln/xVlmUJzUNme1+QIxhV0hBWfQaEZa66fQ5cigcHaXRuz
 QWHMcFFvWUzQ7ZCNaCCi3SbXaEgURvXfh4pQXQ1IMUOHfYqryoNjS8pXaRGKxUqFql
 7noTDw7ypm4NQtfoNp1htMf7miu6SM1Ya8fH18OoeOv6/ZYRT/9Iw6iuCFUfQXflP/
 EqfveqZZYYoczW0RXY46pUTZKxj3mp6x/57CpfXppepUU7S7m6Xn783/gG03CckJnz
 PHRPoJHols4lQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3B85BA0080;
 Tue,  9 Jun 2020 12:08:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass (mailfrom) smtp.mailfrom=synopsys.com
 (client-ip=104.47.58.170; helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=paltsev@synopsys.com; receiver=<UNKNOWN>)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="aEmfVGnq";
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 86412800D1;
 Tue,  9 Jun 2020 12:08:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/HkukF8Y1hsjieoTA86sifzgb9P4c5DPoWf1NNt1lWRO752pM9kV5ozYBUt1IlhEbMUK4tIywZDpxZNnAYs7SXX4yoD6r6tyh4ZU7d6AkmQTbS5MmXPLTRX/R3/KE0CA/Qoi6t62fhEXrjg3s7PpT3FvR6C6HtgJcAzxYk32/N8QjCHVtmso+We8KqXrfevbXONK96f9y8TjMc7JD2Y+29nsqKYD00mpgwSu4idjpQwBgk5r63nRiycY8q7mqkzmOIZGGxPBgkaAudh90ZzoZIsID41OmL+UqA4ZJeWVreE2j6xU8QZOL0TIQugaOKeEA47532RoY0AWuFgB/lwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CneOXpuZMkPoNxwfoyN3awie1nrGBIJnMia15+Y870o=;
 b=T/HcopoNAbV9XWbm6PF36AwiYgucNsfjJ+X9grx7OgHQAWRYzrA8beOKepgh1Q0X697r7iKKxaRUfHINJGC+6ttazPE741sLtrZkh2u7iEe82FypGH3t563N4rURQIZOL+ATpJcaeMv4jlsTQJ9VTVpdi3rvJdl5y0L3kN/wC9IHI4X4/a0s7jtqX25HMFWribYlsHkv/K9EyErfYJfP6mwH9ki2TvKkPvRBZc9IDmdH8PLxWfl7JQxZ1dYIJi6gilUekMqN+UcuGImqzCpnIDdBH4+orTYxP+6AVe8vBkzGV+sJZSetM4V7xGpbv5qO/jvzbt5KLTrtAZkNrfwtxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CneOXpuZMkPoNxwfoyN3awie1nrGBIJnMia15+Y870o=;
 b=aEmfVGnqDlN+Mz6TaTuK2w8sbn5xXXnrQTjzt6uyudQcjgOfUxWU2lfkXQBzQKBrBixsbLjcSu5Av+in2Beuwf97Xq/PZsTCLtq8Lo2uqQLdOamC5Xm9q1joPERtZ/+ua2Tvq5die+JeYX0JIEB++Os24zNFl/EHdWbl8X5T9RQ=
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 (2603:10b6:910:1a::19) by CY4PR1201MB0006.namprd12.prod.outlook.com
 (2603:10b6:903:d3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 12:08:11 +0000
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::b1bf:dda1:dd1e:8e30]) by CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::b1bf:dda1:dd1e:8e30%5]) with mapi id 15.20.3088.018; Tue, 9 Jun 2020
 12:08:11 +0000
X-SNPS-Relay: synopsys.com
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
Thread-Topic: [PATCH 53/59] drm/arc: Move to drm/tiny
Thread-Index: AQHWEvlb5mSQq60T60WU0QolrVlsW6h57yoAgAAle+CAAAXvgIAUjIQAgA+y2qCAAEc8gIApxpeAgAAoHHCAAA47AIAAexxTgAGneICABcWJSA==
Date: Tue, 9 Jun 2020 12:08:11 +0000
Message-ID: <CY4PR1201MB013654230A216EE7EB3C0E9BDE820@CY4PR1201MB0136.namprd12.prod.outlook.com>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-54-daniel.vetter@ffwll.ch>
 <20200415094512.GA30444@ravnborg.org>
 <MWHPR12MB14532DA5713E3B579ABFE1F4A1DB0@MWHPR12MB1453.namprd12.prod.outlook.com>
 <CAKMK7uGDGgt8Cm_bFoyzeoP2CWyiUNdUwb7GL6Ohu3k0rP0p1w@mail.gmail.com>
 <20200428140842.GL3456981@phenom.ffwll.local>
 <CH2PR12MB3894B40C6D71435D3E759A34A1A20@CH2PR12MB3894.namprd12.prod.outlook.com>
 <CAKMK7uFRt14m24ajYygdRZz=fUMhA9u6=590R2jjhXGq=VtwNA@mail.gmail.com>
 <20200604080507.GT20149@phenom.ffwll.local>
 <CY4PR1201MB01363EB95985A2C64ADA6841DE890@CY4PR1201MB0136.namprd12.prod.outlook.com>
 <CAKMK7uFLvV3=uhfnf=MreKBM==-gzXqx3NrV8KDA2D5sTAn2SQ@mail.gmail.com>
 <CY4PR1201MB013642EB94E07AED91813A5FDE890@CY4PR1201MB0136.namprd12.prod.outlook.com>,
 <CAKMK7uESUnLR1N07T513RjGUAp8FA6oHaO1Y+uvTKpFuM_8+gQ@mail.gmail.com>
In-Reply-To: <CAKMK7uESUnLR1N07T513RjGUAp8FA6oHaO1Y+uvTKpFuM_8+gQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bdfeb1c-6343-43fe-fc86-08d80c6dc7b9
x-ms-traffictypediagnostic: CY4PR1201MB0006:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB00061D1E6F49C1EBD98985BADE820@CY4PR1201MB0006.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V3DXSWg1sPIeJzRDkRk9Z6SK+XLUGiMDLMdqbcRZpz1Qtcc17FJ+HNEj0ZgchVR2vTgibJcXWsQMBWB0SSxjstS70n04wOGnP1YtdJ1tJ4kGW0kcSnAf3iiQ3/oi21Vqhq1hRs9z4SkOVBX3rJAWA4J15LL6YWmcbDfSnJE1rTtzNCRbqSWBtndUffMaBhMkEiieLxmuwBWW8KCRawZyC/HQ8TVj/Id7i313f9IP7OJwokp7Q+thfWB345kZLQFZAGj1jYKX2xnxuTOaFezU2Sn+u7dQHVXHSHYKFKxRjrHCo69fw0FQAVDkoEd12VcL/oHTJFTeu2exMLXsI11W0R9/LSEaJaAHHmFJuoWc4UtbThMYZ/TCnpqc+gvqdZZsD55t4lIQ/WFRRr65inRJ2g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(396003)(366004)(136003)(39860400002)(966005)(33656002)(53546011)(8936002)(54906003)(316002)(6916009)(83080400001)(6506007)(478600001)(8676002)(26005)(83380400001)(64756008)(9686003)(7696005)(55016002)(66556008)(86362001)(4326008)(66446008)(5660300002)(2906002)(186003)(66946007)(71200400001)(91956017)(66476007)(52536014)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: F7N5XI8RXdYPIup4ClZ6jiqr1RhVE3fTgCpQeXW9zoI1LKz0OTwrDKPiqQvkgtSDYgYKoJfTwrAwJnnSa4wDvoqyGo8L2jaaeGXq+u8puztyq4YjaeeUeVWVnypevp0G3GEirDhfDU8avsF83CjncQcaY5WLK1QvVppfpO2qpM0uFCLquvRLGfeSmT+nd+NsRv8r9TeEFu11oj+Kn7Aq6YlmE+lfBXaxLbsJPGiQjj3HrYOtu5nS2ZiPx/23LKf7WhS3lVH7I2IAJPimX7uWEiC6KgZ09JPiu57IlVg+SEY2+AmlmBXBikGHZO3X/udR/h8147p9IJMFok0/nnAEe87m2Copz9wMuqEorc/7A+hOgIhdC55veHfOQOxuWPWmwmZTzyIMIKdtwFfYDspWp+fosIKf9fo3R632nEt326Mdq3I819hitckFB64TjZizymOn0Wtf5zeadlUQZeqH++mZXXuqK5irQHgf7lBt9CzLv0ZZP9fSyNo2/ritvTev
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdfeb1c-6343-43fe-fc86-08d80c6dc7b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 12:08:11.3769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4X0VmWAM5pfQoDiRJ+6WbGxVMh++jsL6Nl49zYfo+QhiH8uvWnmnSM33TiYrQ4rrvclQQrBEP139vGu9SVXc1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0006
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 "snps-arc@lists.infradead.org" <snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

I've got pretty strange results so I need some time to investigate it and probably retest.
I'll send you update in a few days.

---
 Eugeniy Paltsev


________________________________________
From: Daniel Vetter <daniel@ffwll.ch>
Sent: Friday, June 5, 2020 22:55
To: Eugeniy Paltsev
Cc: Intel Graphics Development; DRI Development; Daniel Vetter; Sam Ravnborg; Alexey Brodkin; snps-arc@lists.infradead.org
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny

Hi Eugeniy,

Thanks for testing. I looked at the second one (I hoped it would just
magically disappear) and I still don't understand what's going on
there. My patch series isn't touching that area at all, so really
confused.

I squashed in the bugfix from the previous round into the right
patches, and pushed a branch with just the arcpgu changes here:
https://urldefense.com/v3/__https://cgit.freedesktop.org/*danvet/drm/log/?h=for-eugeniy__;fg!!A4F2R9G_pg!IJ1o4XiXVdStPu--Q-SCTUpRbsbqrjX255R34nuD7L7ptPywOy4SKr21dwSpfOkXIVqH5pM$

Maybe it's something in my pile of not-so-tested stuff :-)

Can you pls test this? And if it still fails, try to bisect where it breaks?

Thanks, Daniel

On Thu, Jun 4, 2020 at 9:00 PM Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
>
> I've tested your change and one issue gone.
>
> However I still see kernel crash (due to invalid read in kernel mode by 0x0 address) on weston stop:
> ----------------------------------->8-------------------------------------------
> Oops
> Path: (null)
> CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.7.0-rc6-01594-g4ceda91a4176-dirty #6
> Workqueue: events drm_mode_rmfb_work_fn
> Invalid Read @ 0x00000000 by insn @ drm_gem_fb_destroy+0x32/0x130
> ECR: 0x00050100 EFA: 0x00000000 ERET: 0x813b9a76
> STAT32: 0x80080602 [IE K     ]  BTA: 0x813b9a72
> BLK: drm_gem_fb_destroy+0xc0/0x130
>  SP: 0x9f055ea4  FP: 0x00000000
> LPS: 0x813560ec LPE: 0x813560f0 LPC: 0x00000000
> r00: 0x00000000 r01: 0x9f6a6100 r02: 0x00000001
> r03: 0x9fd5dde8 r04: 0x810f5de8 r05: 0x00000000
> r06: 0x00000000 r07: 0x00000000 r08: 0x000000e1
> r09: 0x00000000 r10: 0x00000000 r11: 0x000000e1
> r12: 0x813b9b04
>
> Stack Trace:
>   drm_gem_fb_destroy+0x32/0x130
>   drm_framebuffer_remove+0x1d2/0x358
>   drm_mode_rmfb_work_fn+0x28/0x38
>   process_one_work+0x19a/0x358
>   worker_thread+0x2c4/0x494
>   kthread+0xec/0x100
>   ret_from_fork+0x18/0x1c
> ----------------------------------->8-------------------------------------------
>
>
> The stack traces may vary but always end in drm_gem_fb_destroy:
> ----------------------------------->8-------------------------------------------
> Stack Trace:
>   drm_gem_fb_destroy+0x32/0x130
>   drm_mode_rmfb+0x10e/0x148
>   drm_ioctl_kernel+0x70/0xa0
>   drm_ioctl+0x284/0x410
>   ksys_ioctl+0xea/0xa3c
>   EV_Trap+0xcc/0xd0
> ----------------------------------->8-------------------------------------------
> Stack Trace:
>   drm_gem_fb_destroy+0x32/0x130
>   drm_fb_release+0x66/0xb0
>   drm_file_free.part.11+0x112/0x1bc
>   drm_release+0x80/0x120
>   __fput+0x98/0x1bc
>   task_work_run+0x6e/0xa8
>   do_exit+0x2b4/0x7fc
>   do_group_exit+0x2a/0x8c
>   get_signal+0x9a/0x5f0
>   do_signal+0x86/0x23c
>   resume_user_mode_begin+0x88/0xd0
> ----------------------------------->8-------------------------------------------
>
>
> ---
>  Eugeniy Paltsev
>
>
> ________________________________________
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Thursday, June 4, 2020 14:19
> To: Eugeniy Paltsev
> Cc: Intel Graphics Development; DRI Development; Daniel Vetter; Sam Ravnborg; Alexey Brodkin
> Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
>
> Hi Eugeniy,
>
> Apologies, somehow I missed your mail. I looked at the code again, and I
> think I fumbled something. Does the below diff help to prevent the issues?
>
> Thanks, Daniel
>
>
> diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
> index 857812f25bec..33d812a5ad7f 100644
> --- a/drivers/gpu/drm/tiny/arcpgu.c
> +++ b/drivers/gpu/drm/tiny/arcpgu.c
> @@ -228,6 +228,9 @@ static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
>         struct arcpgu_drm_private *arcpgu;
>         struct drm_gem_cma_object *gem;
>
> +       if (!pipe->plane.state->fb)
> +               return;
> +
>         arcpgu = pipe_to_arcpgu_priv(pipe);
>         gem = drm_fb_cma_get_gem_obj(pipe->plane.state->fb, 0);
>         arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - https://urldefense.com/v3/__http://blog.ffwll.ch__;!!A4F2R9G_pg!P0EvyJfMuDwqbeZmHZM5S9po30QWr4KgGrggRirNfgo7wrRXfnUO-8iq0AA4fQCW2WGPlDc$



--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - https://urldefense.com/v3/__http://blog.ffwll.ch__;!!A4F2R9G_pg!IJ1o4XiXVdStPu--Q-SCTUpRbsbqrjX255R34nuD7L7ptPywOy4SKr21dwSpfOkXpn86Q20$
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
