Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BF512AFBB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 00:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D654289D84;
	Thu, 26 Dec 2019 23:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C1789D84
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 23:27:25 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id f10so21172710ils.8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 15:27:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=079ePGuH4LFeB4eTg/R3HlprnewzRRTDmlXGUNyMiYE=;
 b=g9s8jjmLMwLY5wPqCRLoblU3utXLaBWosk25BL87eN3H0qbNHphzSG7FnOEAT3ViX5
 jk7oGTYwCk6AHbuRZ2ZNTrcD9I7NZEKRbnolBzryQPS8BgQeZzS3Adc4yOmksA3L+MQ4
 sjmmaL+cG4qaMfWli30vrkjRjPixoWKF3dTCGleM0MjWzQacuIOiIr/9kPtZQkidvkvP
 K9a8/697LoRGYX9O6XWCvnF7FF/fQ9fiwF6dKQI/t1yfkYPxc4SDK/T3PiaPxd8r/Si6
 bxgBdr46/sPY7xDgAU2XHPyBtI3tcy0YhDs0EQgWvJrtrJIjhQWQ33iuPteGcXpGbdIt
 tusA==
X-Gm-Message-State: APjAAAVFPsP3H4HzRySGSMshipGwlEypPLFDVq046VZlrZoHBYdTXOkE
 4Zi9ELbEMggK1YZX/cCr5w==
X-Google-Smtp-Source: APXvYqy+c0rmXNLffc3Rk6rkLD6TvFeAK3D5lvZQZ6C/dxSMer9A1oMxAvU0bFVT+udEDZaLDenKEw==
X-Received: by 2002:a92:4717:: with SMTP id u23mr39096860ila.190.1577402845221; 
 Thu, 26 Dec 2019 15:27:25 -0800 (PST)
Received: from localhost ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id 81sm12626716ilx.40.2019.12.26.15.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 15:27:24 -0800 (PST)
Date: Thu, 26 Dec 2019 16:27:23 -0700
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 1/3] dt-bindings: Add vendor prefix for Leadtek
 Technology
Message-ID: <20191226232723.GA5257@bogus>
References: <20191224112641.30647-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191224112641.30647-1-heiko@sntech.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, maxime@cerno.tech,
 sam@ravnborg.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Dec 2019 12:26:39 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Shenzhen Leadtek Technology Co., Ltd. produces for example display
> and touch panels.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
