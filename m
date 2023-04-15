Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2115C6E317F
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 15:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6142E10E0C3;
	Sat, 15 Apr 2023 13:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DB810E0C3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 13:09:10 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id jg21so52095953ejc.2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 06:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681564148; x=1684156148;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MmkdB2m8LRfDVpq0AlbkUd9MRTLzgba0G5f/0MwvZKM=;
 b=POTaPjGb3OHOUpgy5zifdsNyPIwXCKUxu7EPej3sqe/Z7BvGs/j5qFd8y4lQE1Jeui
 IpgXJjIBYg6GkU2CfMmq6VH+QiSkhlLq6LSLMJsuc9ZylhrPbkYIpLk20a0NlNz/sQsH
 r+/Y6G5nPslMwdbW7TSWyBFNtTnz7AjH5DTWBfapEjmADr5Z4PCjMwlAbiI8pJH5oLcG
 94YiHkE4EUFJBh3lY4JgHTDHdB8tRxDb7J2OufrZS6sv7Ag+duA7rdZgp6kkVNlYguQq
 cPcM6Ig3uV1+a8Xa99vwIz8SghLr8B/ueyi6bYxVnXIT5PQLcRuRdpMpo9edeReahm+a
 /H9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681564148; x=1684156148;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MmkdB2m8LRfDVpq0AlbkUd9MRTLzgba0G5f/0MwvZKM=;
 b=l8fC7vliGsGUVA2weDtJXNh9Wk3tmA4ypWLUNY72KUZtZgIus13KiKOAaRwoMH0DPv
 N1vwNHwcb4lQDwe4XGH01tD9vANMLW+8u43mIzkfSHPTt+0H1fQqK9M/EnTT+oulVuUr
 olQcuyE1ceZ9+5GFFk5gTPlL1QAPOxEHmpMpbWaR3gG/6ITjIVS/VU52CAuwHmXJLMdm
 d0K4GrRgsT3CdNmmgmMkpiSSmK30gA6I12GXsS2JJ8WwVjQZEE/BZu6rVeX3WmfPFw6A
 0wcdWU1vEz0iEg1ME8r3Z8WRd674NU0ZXNkK/bOTz61W//F/CX+onbhBUD7JvU2k6RdA
 wpkg==
X-Gm-Message-State: AAQBX9eRS0gbHi6T9BgvXP4vdjsnCv7Q0QbFyPzgSkn4OXqXziWRLWAZ
 U2C0F9y/xDrEefKOOnpcpLE=
X-Google-Smtp-Source: AKy350ZhV6fvjwW6Xnvq0B7PDvaEeeE6aHsGUoHHDgmmqIjW4CB++PzEuCxne4xPtEYQWWzKgpqmoQ==
X-Received: by 2002:a17:906:d20d:b0:949:797e:ea91 with SMTP id
 w13-20020a170906d20d00b00949797eea91mr1877911ejz.56.1681564147760; 
 Sat, 15 Apr 2023 06:09:07 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 fl3-20020a1709072a8300b0094f396c7a7asm74422ejc.214.2023.04.15.06.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 06:09:07 -0700 (PDT)
Date: Sat, 15 Apr 2023 16:09:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] video: fbdev: mmp: Fix deferred clk handling in
 mmphw_probe()
Message-ID: <67353089-4966-424c-99c2-8524818f0e37@kili.mountain>
References: <685f452cacc74f4983aaff2bc28a02a95e8aa8b7.1681414375.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <685f452cacc74f4983aaff2bc28a02a95e8aa8b7.1681414375.git.christophe.jaillet@wanadoo.fr>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 09:33:17PM +0200, Christophe JAILLET wrote:
> When dev_err_probe() is called, 'ret' holds the value of the previous
> successful devm_request_irq() call.
> 'ret' should be assigned with a meaningful value before being used in
> dev_err_probe().
> 
> While at it, use and return "PTR_ERR(ctrl->clk)" instead of a hard-coded
> "-ENOENT" so that -EPROBE_DEFER is handled and propagated correctly.
> 
> Fixes: 81b63420564d ("video: fbdev: mmp: Make use of the helper function dev_err_probe()")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Presumably you already wrote a Coccinelle script for this but I've added
it to Smatch as well.

regards,
dan carpenter

diff --git a/check_zero_to_err_ptr.c b/check_zero_to_err_ptr.c
index 88ca0285948a..fa2a1f1603b2 100644
--- a/check_zero_to_err_ptr.c
+++ b/check_zero_to_err_ptr.c
@@ -157,11 +157,12 @@ static void match_err_ptr(const char *fn, struct expression *expr, void *data)
 {
 	struct expression *arg_expr;
 	struct sm_state *sm, *tmp;
+	int arg = PTR_INT(data);
 
 	if (is_impossible_path())
 		return;
 
-	arg_expr = get_argument_from_call_expr(expr->args, 0);
+	arg_expr = get_argument_from_call_expr(expr->args, arg);
 	sm = get_sm_state_expr(SMATCH_EXTRA, arg_expr);
 	if (!sm)
 		return;
@@ -194,13 +195,36 @@ static void match_err_ptr(const char *fn, struct expression *expr, void *data)
 	} END_FOR_EACH_PTR(tmp);
 }
 
+static void match_err_ptr_or_zero(const char *fn, struct expression *expr, void *data)
+{
+	struct expression *arg;
+	struct range_list *rl;
+	char *name;
+
+	if (is_impossible_path())
+		return;
+
+	arg = get_argument_from_call_expr(expr->args, 0);
+	get_absolute_rl(arg, &rl);
+
+	if (rl_intersection(rl, valid_ptr_rl))
+		return;
+
+	name = expr_to_str(arg);
+	sm_warning("'%s' is never a valid pointer", name);
+	free_string(name);
+}
+
 void check_zero_to_err_ptr(int id)
 {
 	if (option_project != PROJ_KERNEL)
 		return;
 
 	my_id = id;
-	add_function_hook("ERR_PTR", &match_err_ptr, NULL);
-	add_function_hook("ERR_CAST", &match_err_ptr, NULL);
-	add_function_hook("PTR_ERR", &match_err_ptr, NULL);
+	add_function_hook("ERR_PTR", &match_err_ptr, INT_PTR(0));
+	add_function_hook("ERR_CAST", &match_err_ptr, INT_PTR(0));
+	add_function_hook("PTR_ERR", &match_err_ptr, INT_PTR(0));
+	add_function_hook("dev_err_probe", &match_err_ptr, INT_PTR(1));
+
+	add_function_hook("ERR_PTR_OR_ZERO", &match_err_ptr_or_zero, NULL);
 }
