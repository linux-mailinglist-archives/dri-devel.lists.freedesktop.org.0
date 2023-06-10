Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88A972AEE8
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 23:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF11810E050;
	Sat, 10 Jun 2023 21:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Sat, 10 Jun 2023 21:04:04 UTC
Received: from qs51p00im-qukt01080301.me.com (qs51p00im-qukt01080301.me.com
 [17.57.155.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA79210E050
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 21:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1686430679; bh=edgqTqSIFevJ9hVvZr6vzkAs1XQusMzQ+xtrbHYPRgA=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=1+I7SYqeumYfdZxp6dLNSjGut/KI1/Jlwmuk3Vbx4LvFIHG/94fliN/SlrteDLM0X
 1HJwdUnDgdfi+p3AHYLuRGccFDqltSOXaG/SRLDL4pEpsEHaZT4rsNyHkHJ3ad5rzG
 zW8VQA9+8G8zyug3VFfUPFNYj/Pfl6uW8KeeusX+iVYj8lUwjENW/mYZ4DLKNK9dif
 rfVqkozo7SyYmNL692KxkF0jMtiStKLZW0ldTEkLGVl4OPQ7qf/xxUfsskzbJWP74n
 pLt5id45GjCvEnBOU+XgEmp3raH6ctN5NctYXvZzD/BGw1IYWFnv9prMHkWkE7Lbzn
 3pjtQPpusCTUA==
Received: from macminiubuntu (qs51p00im-dlb-asmtp-mailmevip.me.com
 [17.57.155.28])
 by qs51p00im-qukt01080301.me.com (Postfix) with ESMTPSA id C9F5E5F002BA;
 Sat, 10 Jun 2023 20:57:57 +0000 (UTC)
Date: Sat, 10 Jun 2023 20:57:54 +0000
From: Alain Volmat <avolmat@me.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH RESEND] drm/sti: Avoid full proxy f_ops for sti debug
 attributes
Message-ID: <ZITj0iEGWv4Oexoo@macminiubuntu>
Mail-Followup-To: Deepak R Varma <drv@mailo.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
References: <Y/+uXCDxxA+3AzMq@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/+uXCDxxA+3AzMq@ubun2204.myguest.virtualbox.org>
X-Proofpoint-ORIG-GUID: yZ04d5MqL2iZCXma1sYA9uaF1vJ04-Hx
X-Proofpoint-GUID: yZ04d5MqL2iZCXma1sYA9uaF1vJ04-Hx
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.790,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-12=5F02:2020-02-14=5F02,2022-01-12=5F02,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 suspectscore=0 clxscore=1011 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2306100183
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alain Volmat <alain.volmat@foss.st.com>,
 Alain Volmat <avolmat@me.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Deepak,

thank you for the patch and sorry for the delay.

Acked-by: Alain Volmat <avolmat@me.com>

Alain

On Thu, Mar 02, 2023 at 01:28:20AM +0530, Deepak R Varma wrote:
> Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> function adds the overhead of introducing a proxy file operation
> functions to wrap the original read/write inside file removal protection
> functions. This adds significant overhead in terms of introducing and
> managing the proxy factory file operations structure and function
> wrapping at runtime.
> As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> with debugfs_create_file_unsafe() is suggested to be used instead.  The
> DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> debugfs_file_put() wrappers to protect the original read and write
> function calls for the debug attributes. There is no need for any
> runtime proxy file operations to be managed by the debugfs core.
> Following coccicheck make command helped identify this change:
> 
> make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Note: Change cross compile tested using stm32_defconfig for arm
>       Resending patch for review and feedback. Initially sent on Jan 11 2023
> 
> 
> 
>  drivers/gpu/drm/sti/sti_drv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index ef6a4e63198f..c9be82043638 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -67,8 +67,8 @@ static int sti_drm_fps_set(void *data, u64 val)
>  	return 0;
>  }
>  
> -DEFINE_SIMPLE_ATTRIBUTE(sti_drm_fps_fops,
> -			sti_drm_fps_get, sti_drm_fps_set, "%llu\n");
> +DEFINE_DEBUGFS_ATTRIBUTE(sti_drm_fps_fops,
> +			 sti_drm_fps_get, sti_drm_fps_set, "%llu\n");
>  
>  static int sti_drm_fps_dbg_show(struct seq_file *s, void *data)
>  {
> @@ -97,8 +97,8 @@ static void sti_drm_dbg_init(struct drm_minor *minor)
>  				 ARRAY_SIZE(sti_drm_dbg_list),
>  				 minor->debugfs_root, minor);
>  
> -	debugfs_create_file("fps_show", S_IRUGO | S_IWUSR, minor->debugfs_root,
> -			    minor->dev, &sti_drm_fps_fops);
> +	debugfs_create_file_unsafe("fps_show", S_IRUGO | S_IWUSR, minor->debugfs_root,
> +				   minor->dev, &sti_drm_fps_fops);
>  
>  	DRM_INFO("%s: debugfs installed\n", DRIVER_NAME);
>  }
> -- 
> 2.34.1
> 
> 
> 
