Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C097F73B5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 13:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602E410E1CC;
	Fri, 24 Nov 2023 12:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E697810E1CC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 12:23:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-332e58d4219so803170f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 04:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700828596; x=1701433396; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WmpWOnIjJiqlntDM7DU7aU0bZUCK9yexTXiDAuYZOwQ=;
 b=ewAAtqyTm6gFpkY+0A6X0JTEjXA4TknRis/xrIIvNf3BMt8iTgU340F0Qfdu3w7unK
 J3Ftt83q4cRtQaZIaN/YI1IYPaCj4igaRRNNhdvIm8vCr54xwSqc6kZZhnDyJIfam2qk
 zzenzyxOW1jGVYM6It79njOAm/Ztj5L/yZh6skeS69NFaRCDEJ0O4ZVCNDfoihn9rGrv
 MYJVjPBk9UeFZkBKqP3wLUxqwhKL1G60uGUEJvF4BQi7j40RdZ6MamAZ46AAuw+Bs6jm
 AXEvgIgRoA2XO3MmID6dX3Q2Ps+GZqoCex1asw2ZrUVX0EVI/Z0aNDs56Z9Uj3CgGzUk
 J6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700828596; x=1701433396;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WmpWOnIjJiqlntDM7DU7aU0bZUCK9yexTXiDAuYZOwQ=;
 b=W80ASR80+x/xIly5R7hAL0clde4Ny+qvETkAqlDug3zNhmGqwlMcBvaQPIg0Pjc5Y7
 T3R//BARXiXjsptq2xROlLtCoRXHnVwFsk2vHTHdxrrWRKpSr7wQXAPdXPiRtwwZh1SN
 5djicIokzu1cuswec2i8XLtPn+mzmIDShZni4pchnyaeYIqFv0qHe0i5T0QoParQQaIS
 K3jpJY/haIvR9nLd5XeC0vUpnxW+2nINkEl7bNGLGlAPKxubwkSWWYpqT5N3TraHwA7H
 Dw7RSazqW6pDCY3OIxIfwkBnhTKfgSPmK/0HU6w3sj2239SP6oazoVNa5JkTw1Ikd/RZ
 8Dcg==
X-Gm-Message-State: AOJu0Yz+Evbr1omddw2fNCNwP0kRYvDjX9as/3o/+bT7mmOM0nVzq2jV
 ovVMSF3nVTjoY6aRlQOD4A4+hg==
X-Google-Smtp-Source: AGHT+IGCu/qhVATWQaKdWBrRB1xJnkzyKLuuZ35mRvJBX1rnQOSh/Wd8rZJKW6P07U2qD2LOrCB8EA==
X-Received: by 2002:adf:f5c2:0:b0:332:eb19:9527 with SMTP id
 k2-20020adff5c2000000b00332eb199527mr1022421wrp.60.1700828596173; 
 Fri, 24 Nov 2023 04:23:16 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a5d6848000000b0031980294e9fsm4143894wrw.116.2023.11.24.04.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 04:23:15 -0800 (PST)
Message-ID: <8cf55d82-afb7-475a-bc0b-ec33b56340dd@linaro.org>
Date: Fri, 24 Nov 2023 12:23:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] drm: simplify support for transparent DRM bridges
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/11/2023 23:03, Dmitry Baryshkov wrote:
> Supporting DP/USB-C can result in a chain of several transparent
> bridges (PHY, redrivers, mux, etc). All attempts to implement DP support
> in a different way resulted either in series of hacks or in device tree
> not reflecting the actual hardware design. This results in drivers
> having similar boilerplate code for such bridges.
> 
> Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> bridge can either be probed from the bridge->attach callback, when it is
> too late to return -EPROBE_DEFER, or from the probe() callback, when the
> next bridge might not yet be available, because it depends on the
> resources provided by the probing device. Device links can not fully
> solve this problem since there are mutual dependencies between adjancent
> devices.
> 
> Last, but not least, this results in the the internal knowledge of DRM
> subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
> 
> To solve all these issues, define a separate DRM helper, which creates
> separate aux device just for the bridge. During probe such aux device
> doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> drivers to probe properly, according to the actual resource
> dependencies. The bridge auxdevs are then probed when the next bridge
> becomes available, sparing drivers from drm_bridge_attach() returning
> -EPROBE_DEFER.

Dmitry,

Looking to give you a Tested-by: here but got the below splat.

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/next-20231123-tcpm-fix?ref_type=heads

- Boot via fastboot
- Remove USB cable
- Attach DisplayPort cable
- Get some activity on the DP
- Then this

root@linaro-gnome:~# [  376.861822] xhci-hcd xhci-hcd.4.auto: xHCI Host 
Controller
[  376.867584] xhci-hcd xhci-hcd.4.auto: new USB bus registered, 
assigned bus number 3
[  376.875775] xhci-hcd xhci-hcd.4.auto: hcc params 0x0230ffe5 hci 
version 0x110 quirks 0x0000000000000010
[  376.885666] xhci-hcd xhci-hcd.4.auto: irq 229, io mem 0x0a600000
[  376.892140] xhci-hcd xhci-hcd.4.auto: xHCI Host Controller
[  376.897951] xhci-hcd xhci-hcd.4.auto: new USB bus registered, 
assigned bus number 4
[  376.905869] xhci-hcd xhci-hcd.4.auto: Host supports USB 3.1 Enhanced 
SuperSpeed
[  376.914130] hub 3-0:1.0: USB hub found
[  376.918030] hub 3-0:1.0: 1 port detected
[  376.922417] usb usb4: We don't know the algorithms for LPM for this 
host, disabling LPM.
[  376.931540] hub 4-0:1.0: USB hub found
[  376.935439] hub 4-0:1.0: 1 port detected
[  377.885638] Unable to handle kernel NULL pointer dereference at 
virtual address 0000000000000060
[  377.892927] msm_dpu ae01000.display-controller: [drm] Cannot find any 
crtc or sizes
[  377.894724] Mem abort info:
[  377.905504]   ESR = 0x0000000096000004
[  377.909375]   EC = 0x25: DABT (current EL), IL = 32 bits
[  377.914852]   SET = 0, FnV = 0
[  377.918005]   EA = 0, S1PTW = 0
[  377.921250]   FSC = 0x04: level 0 translation fault
[  377.926269] Data abort info:
[  377.929239]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[  377.934881]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[  377.940095]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[  377.945563] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000101992000
[  377.952441] [0000000000000060] pgd=0000000000000000, p4d=0000000000000000
[  377.959448] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[  377.965882] Modules linked in: typec_displayport nf_tables libcrc32c 
nfnetlink q6asm_dai q6routing q6afe_clocks q6afe_dai q6asm q6adm 
snd_q6dsp_common q6afe q6core apr pdr_interfacer
[  377.965984]  aux_bridge crct10dif_ce snd_soc_lpass_macro_common 
drm_kms_helper qnoc_sm8250 qcom_wdt icc_osm_l3 fuse drm backlight dm_mod 
ip_tables x_tables
[  378.072201] CPU: 5 PID: 379 Comm: dp_hpd_handler Not tainted 
6.7.0-rc2-next-20231123-00008-g812004aeedc0-dirty #30
[  378.082817] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[  378.088884] msm_dpu ae01000.display-controller: [drm] Cannot find any 
crtc or sizes
[  378.089697] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[  378.089700] pc : drm_object_property_set_value+0x0/0x88 [drm]
[  378.110607] lr : drm_dp_set_subconnector_property+0x58/0x64 
[drm_display_helper]
[  378.118205] sp : ffff800081fbbda0
[  378.121616] x29: ffff800081fbbda0 x28: 0000000000000000 x27: 
0000000000000000
[  378.128940] x26: 0000000000000000 x25: 0000000000000000 x24: 
ffff38d1ccef2880
[  378.136264] x23: ffff38d1ccef2a10 x22: ffff38d1ccef2880 x21: 
ffff38d1ccef29f0
[  378.143587] x20: 0000000000000000 x19: ffff38d1ccef2880 x18: 
0000000000000000
[  378.150911] x17: 000000040044ffff x16: ffffa79c03e1fe34 x15: 
0000000000000000
[  378.158235] x14: ffff38d1c5861000 x13: 00000000000003ec x12: 
0000000000000001
[  378.165560] x11: 071c71c71c71c71c x10: 0000000000000b00 x9 : 
ffff800081fbb9d0
[  378.172884] x8 : ffffa79b9b4d9000 x7 : 0000000000000001 x6 : 
ffffa79b9b6d74b0
[  378.180207] x5 : 0000000000000000 x4 : ffff38d1cb2d3800 x3 : 
ffff38d1c28e169f
[  378.187530] x2 : 000000000000000f x1 : 0000000000000000 x0 : 
ffff38d1cb2d3840
[  378.194853] Call trace:
[  378.197376]  drm_object_property_set_value+0x0/0x88 [drm]
[  378.202947]  dp_display_process_hpd_high+0xa0/0x14c [msm]
[  378.208526]  dp_hpd_plug_handle.isra.0+0x8c/0x10c [msm]
[  378.213918]  hpd_event_thread+0xc4/0x56c [msm]
[  378.218508]  kthread+0x110/0x114
[  378.221828]  ret_from_fork+0x10/0x20
[  378.225506] Code: 128002a0 d65f03c0 d4210000 17ffffea (f9403024)
[  378.231763] ---[ end trace 0000000000000000 ]---
[  384.505974] msm_dpu ae01000.display-controller: [drm] Cannot find any 
crtc or sizes
[  385.538016] msm_dpu ae01000.display-controller: [drm] Cannot find any 
crtc or sizes
[  385.666018] msm_dpu ae01000.display-controller: [drm] Cannot find any 
crtc or sizes


