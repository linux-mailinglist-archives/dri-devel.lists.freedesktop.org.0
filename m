Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZA1cLsk1gWmUEwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 00:39:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1380D2B0B
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 00:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636A310E3DB;
	Mon,  2 Feb 2026 23:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="wDevap5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B3510E3DB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 23:39:47 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b885e8c6700so827009366b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 15:39:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770075586; cv=none;
 d=google.com; s=arc-20240605;
 b=FXmyd6awFk75QpcYeDIRCEQ8n19YroWas9naH9t5mEoY7apEeNj9QZ9VcldxOBA23Q
 TCFAR9dmOGADWONTiBnO9kiOGCLG8NH64En9g8x6HIhZBy3ZLdYDl8jls31836doDwdM
 0nE7WB8npAvH59FeT0SPkOcHu/Z3kZGzgcyVO4cuse2lX9xS3i1JCUie7ZfjhGDMlGqw
 KLZ+qAkvTBT1RM7EV6GUi+Hz7HSYU6SZD/weM31XgJoLst1sA+h6zpvkzRq/xFwSgpCQ
 qh5JjFsVfwRCEH0fSaKZhsTeWSgd1JMaXtQHrgTlWditJP6zRTEQQBSiqJWs2EeQkSAW
 iUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hTJVlTXZf0jwUnohGdUIElqTyOY3pmo4nlrgTREuxjw=;
 fh=2dmh0iBV1twiX1VeJvztNZLysdOQUdkMhIBX8wFUfjA=;
 b=bTUw011Dmkdc1QpkasOy7spLuagKuTXkyZCSo4Ne+puPbv26+GwCu9hmMvJioIpIDO
 RGAAKpMv19sXVpLaeqCDdSyBlcwb7XsZV/X0V7vhfX/LcS2pa6q8lPwcJJ8ofQWZlR2n
 xeEYUa7LghCvVObDI/XfHHZugQnw+5EH6DsjiQJPqj3YlF9pS00nmuXD62A1HXeQpKTK
 Lqz1pMgAXayWKvCSJcg6IzHD6M1yLhBt9UN4EjsP5hFj0lMo/cVnFSrilrYBJ16AztKm
 YmogxfZkkxY4IyhCUQYK16lCfszYEIDkDlc5N4Ilu1pXesEINrcP31ZySG7RyTEz77J6
 9zuA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1770075586;
 x=1770680386; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hTJVlTXZf0jwUnohGdUIElqTyOY3pmo4nlrgTREuxjw=;
 b=wDevap5+mwj7eDCTyGkkJax4sHtRrg58uz4ojO7fCZ3dreoiakcBgoYKMZa/X7knDx
 IeXqCJXLiKWr1w1nnd5tHJ1PpEC3tB6FkNpUZPsbL8OGBR2tnouBJSeLjYpzpxqoKyhc
 yvt/0/MWLSeBjRJ1vBb3zhZE+IjDeBipF0z8H2z+F8OtXRCyDykpCmq276Rr3JInNXWo
 mSBAKdK61beF29XMP6zM+xlEJAJUTVXiYJHoznuBvFRxTM9lum8EzeMcv1IKmgLg/CW/
 A0y/cjNiifeEFRk6YBAhkicz1FcXxnsdmArwr+qm9mPvMRjVLKhjRnTlSRkzfdR8DCZs
 TP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770075586; x=1770680386;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTJVlTXZf0jwUnohGdUIElqTyOY3pmo4nlrgTREuxjw=;
 b=qdW5viHZLSHp9gjgcEAnEmje0BIOBXW0epm0ZWWnwy8CmONO2bjtmxU/kIJT0X8Yqj
 nY+qqld+9BKp2e2IaeU+uTn3TFyh2194NdqPxEZUMmfuUZN52cuRY7IN8G1v1Rt9a1YW
 aBe4Qq7fHNF/yUFEk6G6BvuTRX56eXdInh3G1xAwZT8Zie4Rx9mdDYpyVWmELkqszJVG
 OWdnUfmmH16v4Xh1aFNZ+PSH1KtstaTrKYBRnVxye5IH6/gfmcq9Rh1o4PPaBgYWtY1h
 vkCbHb2Ofq63c4+9DU1EqlJ1WtNAzV4HXSiZVYaGu5nLri8I6LT/0nWGXCoMwOtLpS1u
 QBxA==
X-Gm-Message-State: AOJu0Yzjr6hH/JketTcOQlDSn3ETrTdSRFhhF1Dr+FQZcGKGM5pulgni
 WeLUICsa5CJ5YkDMfaVcYF1Y8tzThCUZN5hN6MxMQ+BcSSJ6cvfYl1JCjY12IMqkkb7T68Sd8RH
 53PdrOfDp+m0HiOGZr4omDx4eeP0iQetKf/ImKM3NZQ==
X-Gm-Gg: AZuq6aL4EhENt8A4w7+ZhllHuG6IE9ki3Jl7VSztFegbvRTiJkGfeUVLhEUpJa9gjgv
 7z2VMN2rMHFbURoH+Uj1dLkx4XCLvUssSARO8V5x+LNGcYDzAN+VUqmUM0YqCv0WvQR3qS+Wyew
 hB8WWqKgBfp07F2na4r6cueHwJwo/QAAvHAKH4pgYM2sKnBPGGaYDrG0EUDbZ7kbPpPERlyiq/M
 m/lYfJxshti8FEEdNfjl+oSrZd9/ji3jvT5oFaDUu76evWK1g0ESS8j86SxrjxcTz2KCvq1
X-Received: by 2002:a17:907:d1f:b0:b76:63b8:7394 with SMTP id
 a640c23a62f3a-b8dff793326mr811057966b.51.1770075585598; Mon, 02 Feb 2026
 15:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20260202220402.2217813-1-airlied@gmail.com>
In-Reply-To: <20260202220402.2217813-1-airlied@gmail.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Mon, 2 Feb 2026 18:39:19 -0500
X-Gm-Features: AZwV_QiupyyTlsy3i7q-XlPZg5ZLkEihNGRHTrovNO1BWwCoVC562zsqkF9XjoU
Message-ID: <CAAgWFh03m1Pu=uNPtqGpP-y1PAqNUvyUvo1-K-qP5dHzrh3T1A@mail.gmail.com>
Subject: Re: [PATCH] nouveau/vmm: start tracking if the LPT PTE is valid. (v4)
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[darkrefraction-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[darkrefraction.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:nouveau@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[darkrefraction-com.20230601.gappssmtp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,darkrefraction-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: E1380D2B0B
X-Rspamd-Action: no action

This one seems to fix the reproducer shell script in the description
of https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610 on my
machine

I'll do a cts run tonight.
