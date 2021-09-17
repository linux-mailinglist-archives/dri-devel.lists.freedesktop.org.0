Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E9340FF54
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 20:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D926EE65;
	Fri, 17 Sep 2021 18:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08DF6EE65
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 18:25:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631903121; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=UEpXqCzItXHNUdnGv38tuk52NOlpsqNpF/9PDvpy/8M=;
 b=PYVYBuFoJrnx9+L5C6KXwnO99MbNVjGJ8CnSCK+Blqo8Yon0TVfPvua6JAZ7hiMKQBTkEH02
 ROslPq1vAD98TirhRoi4DnRYTU7SNXmInNOJeZe0TTjepe1PA5KVbJQZIpNWq84QS3DyFp/h
 9Q1Y34eifpyiTIliDK7TfpVFcm8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6144dd86ec62f57c9a60bbd6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 18:25:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 11199C43618; Fri, 17 Sep 2021 18:25:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F2334C4338F;
 Fri, 17 Sep 2021 18:25:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 17 Sep 2021 11:25:08 -0700
From: abhinavk@codeaurora.org
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>
Subject: Re: [RESEND PATCH v6 05/14] drm/print: rename drm_debug* to be more
 syslog-centric
In-Reply-To: <20210721175526.22020-6-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-6-sean@poorly.run>
Message-ID: <f4b27dfe794669b333ffd41e71a4262d@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-07-21 10:55, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> In preparation for tracefs support, rename drm_debug related functions
> to reflect that it targets the syslog. This will allow us to 
> selectively
> target syslog and/or tracefs.
> 
> No functional changes here.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-6-sean@poorly.run
> #v5
> 
> Changes in v5:
> -Added to the set
> Changes in v6:
> -None
> ---
>  drivers/gpu/drm/drm_print.c | 12 ++++++------
>  include/drm/drm_print.h     | 13 +++++++++----
>  2 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 111b932cf2a9..2ff7a6ecc632 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -37,11 +37,11 @@
>  #include <drm/drm_print.h>
> 
>  /*
> - * __drm_debug: Enable debug output.
> + * __drm_debug_syslog: Enable debug output to system logs
>   * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
>   */
> -unsigned int __drm_debug;
> -EXPORT_SYMBOL(__drm_debug);
> +unsigned int __drm_debug_syslog;
> +EXPORT_SYMBOL(__drm_debug_syslog);
> 
>  MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables
> a debug category.\n"
>  "\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
> @@ -52,7 +52,7 @@ MODULE_PARM_DESC(debug, "Enable debug output, where
> each bit enables a debug cat
>  "\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
>  "\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
>  "\t\tBit 8 (0x100) will enable DP messages (displayport code)");
> -module_param_named(debug, __drm_debug, int, 0600);
> +module_param_named(debug, __drm_debug_syslog, int, 0600);
> 
>  void __drm_puts_coredump(struct drm_printer *p, const char *str)
>  {
> @@ -160,11 +160,11 @@ void __drm_printfn_info(struct drm_printer *p,
> struct va_format *vaf)
>  }
>  EXPORT_SYMBOL(__drm_printfn_info);
> 
> -void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf)
> +void __drm_printfn_debug_syslog(struct drm_printer *p, struct 
> va_format *vaf)
>  {
>  	pr_debug("%s %pV", p->prefix, vaf);
>  }
> -EXPORT_SYMBOL(__drm_printfn_debug);
> +EXPORT_SYMBOL(__drm_printfn_debug_syslog);
> 
>  void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
>  {
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 9b66be54dd16..2ea0ffd9c1ce 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -35,7 +35,7 @@
>  #include <drm/drm.h>
> 
>  /* Do *not* use outside of drm_print.[ch]! */
> -extern unsigned int __drm_debug;
> +extern unsigned int __drm_debug_syslog;
> 
>  /**
>   * DOC: print
> @@ -85,7 +85,7 @@ void __drm_puts_coredump(struct drm_printer *p,
> const char *str);
>  void __drm_printfn_seq_file(struct drm_printer *p, struct va_format 
> *vaf);
>  void __drm_puts_seq_file(struct drm_printer *p, const char *str);
>  void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf);
> -void __drm_printfn_debug(struct drm_printer *p, struct va_format 
> *vaf);
> +void __drm_printfn_debug_syslog(struct drm_printer *p, struct 
> va_format *vaf);
>  void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf);
> 
>  __printf(2, 3)
> @@ -227,7 +227,7 @@ static inline struct drm_printer
> drm_info_printer(struct device *dev)
>  static inline struct drm_printer drm_debug_printer(const char *prefix)
>  {
>  	struct drm_printer p = {
> -		.printfn = __drm_printfn_debug,
> +		.printfn = __drm_printfn_debug_syslog,
>  		.prefix = prefix
>  	};
>  	return p;
> @@ -319,9 +319,14 @@ enum drm_debug_category {
>  	DRM_UT_DRMRES		= 0x200,
>  };
> 
> +static inline bool drm_debug_syslog_enabled(enum drm_debug_category 
> category)
> +{
> +	return unlikely(__drm_debug_syslog & category);
> +}
> +
>  static inline bool drm_debug_enabled(enum drm_debug_category category)
>  {
> -	return unlikely(__drm_debug & category);
> +	return drm_debug_syslog_enabled(category);
>  }
> 
>  /*
