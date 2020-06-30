Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B653120EB3D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 04:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98378899E8;
	Tue, 30 Jun 2020 02:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0120899E8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 02:03:32 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id r12so9083287ilh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 19:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=arq4AzF5CkvhiBn6DSLrfoxPguoNXuVsu2ZMowJNTtQ=;
 b=AHLFOoBgjBDSlPV4tqjtibSNULFPAZbzolLLjDUcUoon3IfhdJZ49T0YZVg9kLX4go
 LNJPHKd9UWqsgEzEG5qiCrwPllmHja84d16nH332tyGVpI8VCS27GVdWRDJcDueDLuE3
 KiJlJvnFFhPavFYnt6Tszr0eXYYzTVqU1tF1wTgl4GbFy4b1DaHbzrvuL3mAUQreJitb
 Vjc4ZY4c37qqHAreivk8B5g59mE9CbTVnSLIgmke0DSID+kr2UBp+C3pCTmWNXH1EGzz
 CiC42nferMq6cVd2xmn/WTNTvmOJnJc/j7eLRxNaWf6s6IRjHGzxpC7EsaTVXQWoYLM+
 KAHw==
X-Gm-Message-State: AOAM533d3t2tZMb1cPDfstcBQjKkbJGOR+2x0s1dAYkrWHM+3+i43h1h
 OdKUOxpu6SJk55O2rHDa/Ygbe8QkWQ==
X-Google-Smtp-Source: ABdhPJy4YdprQkBab9MNxn7MCyP0zBHmDtP3iUN4v9PGOMDumN1PdNL3gz2xqEUU0sWQx4F9dWvIow==
X-Received: by 2002:a05:6e02:8e4:: with SMTP id n4mr406791ilt.96.1593482611937; 
 Mon, 29 Jun 2020 19:03:31 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
 by smtp.gmail.com with ESMTPSA id a5sm882562ilt.71.2020.06.29.19.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 19:03:31 -0700 (PDT)
Received: (nullmailer pid 3467058 invoked by uid 1000);
 Tue, 30 Jun 2020 02:03:29 -0000
Date: Mon, 29 Jun 2020 20:03:29 -0600
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: arm: versatile: Pass the sysreg
 unit name
Message-ID: <20200630020329.GA3466998@bogus>
References: <20200629215500.18037-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629215500.18037-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Jun 2020 18:55:00 -0300, Fabio Estevam wrote:
> Pass the sysreg unit name to fix the following warning seen with
> 'make dt_binding_check':
> 
> Warning (unit_address_vs_reg): /example-0/sysreg: node has a reg or ranges property, but no unit name
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  .../bindings/display/panel/arm,versatile-tft-panel.yaml         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
