Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 478665AFC0B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 07:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F1C10E318;
	Wed,  7 Sep 2022 05:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Wed, 07 Sep 2022 04:21:49 UTC
Received: from out20-37.mail.aliyun.com (out20-37.mail.aliyun.com
 [115.124.20.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8A110E19E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 04:21:49 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.04517506|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0144003-0.000615202-0.984985;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=wangyugui@e16-tech.com; NM=1;
 PH=DS; RN=2; RT=2; SR=0; TI=SMTPD_---.P9sOKGo_1662524168; 
Received: from 192.168.2.112(mailfrom:wangyugui@e16-tech.com
 fp:SMTPD_---.P9sOKGo_1662524168) by smtp.aliyun-inc.com;
 Wed, 07 Sep 2022 12:16:09 +0800
Date: Wed, 07 Sep 2022 12:16:13 +0800
From: Wang Yugui <wangyugui@e16-tech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
In-Reply-To: <44b97fac-e879-e396-b8f2-f9459a5f913c@suse.de>
References: <20220902135242.2447.409509F4@e16-tech.com>
 <44b97fac-e879-e396-b8f2-f9459a5f913c@suse.de>
Message-Id: <20220907121612.FBFC.409509F4@e16-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 8bit
X-Mailer: Becky! ver. 2.75.04 [en]
X-Mailman-Approved-At: Wed, 07 Sep 2022 05:55:23 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> Am 02.09.22 um 07:52 schrieb Wang Yugui:
> > Hi,
> >
> > mgag200 broken on kernel-6.0-rc3 on DELL/T620.
> >
> > See the attachementment file for the graph output.
> 
> Thanks for reporting the bug. We recently refactored some code of the driver. Can you bisect to the change that introduced the problem?

5.19.3 works well on this DELL/T620.

so this problem should be a regression of 6.0.

other bisect seem difficult for me.

Best Regards
Wang Yugui (wangyugui@e16-tech.com)
2022/09/07


> 
> Best regards
> Thomas
> 
> >
> > [root@T620 ~]# dmesg  |grep -i 'vga\|mga'
> > [    0.588940] Console: colour VGA+ 80x25
> > [    4.918214] pci 0000:0a:00.0: vgaarb: setting as boot VGA device
> > [    4.919028] pci 0000:0a:00.0: vgaarb: bridge control possible
> > [    4.919028] pci 0000:0a:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
> > [    4.941058] vgaarb: loaded
> > [    9.385485] mgag200 0000:0a:00.0: vgaarb: deactivate vga console
> > [    9.510688] [drm] Initialized mgag200 1.0.0 20110418 for 0000:0a:00.0 on minor 0
> > [    9.523145] fbcon: mgag200drmfb (fb0) is primary device
> > [    9.641543] mgag200 0000:0a:00.0: [drm] fb0: mgag200drmfb frame buffer device
> >
> >
> > more info:
> > 1, This DELL/T620 works well with kernel 5.15.63,
> >      so this is not a  hardware error.
> >
> > 2, DELL/T640 works well with kernel 6.0-rc and 5.15.63.
> >      both DELL/T620 and DELL/T640 use the driver 'mgag200'.
> >
> > [root@T640 ~]#  dmesg  |grep -i 'vga\|mga'
> > [   10.161500] pci 0000:03:00.0: vgaarb: setting as boot VGA device
> > [   10.162463] pci 0000:03:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
> > [   10.176527] pci 0000:03:00.0: vgaarb: bridge control possible
> > [   10.182465] vgaarb: loaded
> > [   11.832839] fb0: EFI VGA frame buffer device
> > [   21.303826] mgag200 0000:03:00.0: vgaarb: deactivate vga console
> > [   21.319498] [drm] Initialized mgag200 1.0.0 20110418 for 0000:03:00.0 on minor 0
> > [   21.330223] fbcon: mgag200drmfb (fb0) is primary device
> > [   21.332140] mgag200 0000:03:00.0: [drm] drm_plane_enable_fb_damage_clips() not called
> > [   21.741629] mgag200 0000:03:00.0: [drm] fb0: mgag200drmfb frame buffer device
> >
> > Best Regards
> > Wang Yugui (wangyugui@e16-tech.com)
> > 2022/09/02
> > 
> -- Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N¨¹rnberg, Germany
> (HRB 36809, AG N¨¹rnberg)
> Gesch?ftsf¨¹hrer: Ivo Totev


