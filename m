Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431C7AD0534
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 17:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C9110E38E;
	Fri,  6 Jun 2025 15:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF5F10E042;
 Fri,  6 Jun 2025 05:35:22 +0000 (UTC)
X-QQ-mid: zesmtpgz4t1749188049t95d02e75
X-QQ-Originating-IP: 8itqSUwG57Xz1wRjpsBQU4erKIvz2MIRDy9i7XkRA/k=
Received: from [127.0.0.1] ( [116.237.87.75]) by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 06 Jun 2025 13:34:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5191052925718409957
Message-ID: <EF0467E1FD371A7E+f68ef9be-76d3-4e6a-8c8c-48f07c4228b8@radxa.com>
Date: Fri, 6 Jun 2025 13:34:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT] drm/msm/dpu: enable virtual planes by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250514-dpu-enable-virt-planes-v1-1-bf5ba0088007@oss.qualcomm.com>
From: Xilin Wu <sophon@radxa.com>
Content-Language: en-US
In-Reply-To: <20250514-dpu-enable-virt-planes-v1-1-bf5ba0088007@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NOnalZjVTVf0rIl44+6B8tRQEbE4pxa/de/G2PtZzkl3Xjq4kkt7OCc0
 FmhHX2JhB4Yfsu7kl9I/thBYW/JWqtgUkOdfnEbLzKR7m/jnZNg4wRVtixkxQDpzize0YEj
 OlmBJF0A+IKs2QSpGr4NbWNsMAfk+fNA/gu3OEJGW1eUM1KIqgJAsCC/0lbnsfpWtrQRR2J
 L074ZoAN0jTLOgmXeambsU8mJjIc2lTkWvM6e3evMmIRSzHxxoOXFeaV+V+j4eIaGxmUD1j
 SSu+lEZI10gILUHQSrx6ui+QPFvaN4H79vpDoKLORlsZ17gd+5W5zxqNZgmiIgNB9pwkaMN
 +zsoS9y2JGcE0+JM4vNJIgzB9uxFJ1uEZ1Z+1uS30LRyI4K3Xo8W1HbkO1waFGjYJPxLwuu
 AwnX5ywploIE192N0fjkaN+OBgo/eZv4EzOHpAS6BqnwlV2xIy2+iBdYYV6oRb1P2Vgyvzs
 vNjYcGabjXzsRmnYYyuE3moveTIjPXcvrh6hJYSLx6cikZoRwdonksyrSi9jAWrySPc8XAq
 a+dbYyXkS5UsI2q03pEGFul/H+u9hyRrQg/U3gIkShhAglWvsqETbIWHCPX9YEBLPz2Oq8W
 EsW0kuptATiCshQqrmEBWDqawIeECpWHkKLiFETYhAu+eJVuEAPQj1hHStecBGkSXspoMSS
 h2xDaFzrHYqyDwK8KCxThpoLA9VushUthZB8+cYnDWywLYXLrDJ9tu3SJGTa3WL3sFP3YfZ
 16pBJ0AYzKMJ5qLXy4HnMoUV9YyyOZX6Nv5Nxr8VZ1bpDOtgBtbxpx9nAUqLAX8QAkDEjUR
 famdDMPhurN0RcG1HUhvp3bmJZEG8tcReR5b4oJ8GQqQ8tnbo+XinUmEAPGakAbYpXliUfc
 Tow3q1xi1DSlYY8uUCIuP1+TFtAtbanmV3rQrgVpcaZoAzpJembOYJFPRfU52Z6zFQ3mRVp
 4MK5jW+UkIG/jMQ==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Fri, 06 Jun 2025 15:31:28 +0000
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

On 2025/5/14 07:30:00, Dmitry Baryshkov wrote:
> Turn on the switch and use virtual planes by default, enhancing
> utilisation of the display pipelines. It is still possible to use legacy
> implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
> parameter.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> This is being sent as an RFT for now. Please give it a test with your
> compositor of choice. X11. Weston. Sway. Wlroot. CrOS. I plan to turn
> the switch for 6.17.
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

With virtual planes enabled on qcs6490, I get a kernel Oops every time I 
plug in a mouse.

Steps to reproduce:

1. Set DisplayPort resolution to 1920x1080 (does not happen with 2560x1440)
2. Boot into plasma wayland desktop (v6.3.5) without usb mouse plugged in
3. Plug in the usb mouse

[   53.594217] hid-generic 0003:3554:F55D.0003: input: USB HID v1.11 
Mouse [Compx 2.4G Wireless Receiver] on usb-xhci-hcd.1.auto-1.3/input2
[   53.737874] Unable to handle kernel NULL pointer dereference at 
virtual address 0000000000000020
[   53.746931] Mem abort info:
[   53.749827]   ESR = 0x0000000096000004
[   53.753690]   EC = 0x25: DABT (current EL), IL = 32 bits
[   53.759159]   SET = 0, FnV = 0
[   53.762309]   EA = 0, S1PTW = 0
[   53.765556]   FSC = 0x04: level 0 translation fault
[   53.770584] Data abort info:
[   53.773564]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[   53.779205]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   53.784411]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   53.789880] user pgtable: 4k pages, 48-bit VAs, pgdp=000000010f4fd000
[   53.796511] [0000000000000020] pgd=0000000000000000, p4d=0000000000000000
[   53.803493] Internal error: Oops: 0000000096000004 [#1]  SMP
[   53.809309] Modules linked in:
[   53.812465] CPU: 6 UID: 1000 PID: 677 Comm: kwin_wayland Tainted: G 
      W           6.15.0-next-20250528-00020-gc20b5cd31b70-dirty #16 
PREEMPTLAZY
[   53.826292] Tainted: [W]=WARN
[   53.829356] Hardware name: Radxa Dragon Q6A (DT)
[   53.834108] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[   53.841261] pc : dpu_plane_is_multirect_capable+0x60/0x80
[   53.846818] lr : dpu_assign_plane_resources+0x26c/0x3d0
[   53.852192] sp : ffff800085bf3880
[   53.855610] x29: ffff800085bf38b0 x28: 0000000000000960 x27: 
ffff000090878800
[   53.862946] x26: ffff0000c407d948 x25: ffff00009087a200 x24: 
ffff0000b9a79a80
[   53.870284] x23: ffff0000c407d960 x22: ffff00008006a080 x21: 
ffff000084153880
[   53.877623] x20: ffff800085bf38a5 x19: ffff00009087a000 x18: 
0000000000000000
[   53.884960] x17: 0000000000000000 x16: 0000000000000000 x15: 
0000004200000000
[   53.892297] x14: ffff00009087a400 x13: ffff00008006a718 x12: 
ffff000080dca080
[   53.899632] x11: ffff800085bf38a5 x10: ffff00009087a4b8 x9 : 
0000000000000000
[   53.906970] x8 : ffffd8d2d59a09c0 x7 : 0000000000000000 x6 : 
0000000000000217
[   53.914301] x5 : 0000000000000000 x4 : 0000000000000200 x3 : 
0000000000000200
[   53.921639] x2 : ffffd8d2d59a03c0 x1 : 000000000000000a x0 : 
0000000000000000
[   53.928977] Call trace:
[   53.931505]  dpu_plane_is_multirect_capable+0x60/0x80 (P)
[   53.937055]  dpu_crtc_atomic_check+0x5d0/0x680
[   53.941639]  drm_atomic_helper_check_planes+0x144/0x224
[   53.947014]  drm_atomic_helper_check+0x50/0xa4
[   53.951594]  msm_atomic_check+0xd0/0xe0
[   53.955554]  drm_atomic_check_only+0x4d0/0x910
[   53.960134]  drm_mode_atomic_ioctl+0xa14/0xdf8
[   53.964712]  drm_ioctl_kernel+0xc0/0x130
[   53.968750]  drm_ioctl+0x360/0x4e0
[   53.972259]  __arm64_sys_ioctl+0xac/0x104
[   53.976390]  invoke_syscall+0x48/0x104
[   53.980261]  el0_svc_common.constprop.0+0x40/0xe0
[   53.985109]  do_el0_svc+0x1c/0x28
[   53.988533]  el0_svc+0x34/0x104
[   53.991780]  el0t_64_sync_handler+0x10c/0x138
[   53.996265]  el0t_64_sync+0x198/0x19c
[   54.000038] Code: b9402021 370fffc1 f9401441 3707ff81 (f94010a1)
[   54.006301] ---[ end trace 0000000000000000 ]---

$ aarch64-linux-gnu-addr2line -e ~/build_cache/kernel/dragon-q6a/vmlinux 
dpu_plane_is_multirect_capable+0x60/0x80
/home/strongtz/git/linux-super/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:932


-- 
Best regards,
Xilin Wu <sophon@radxa.com>
