Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA164221410
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 20:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F9C6E293;
	Wed, 15 Jul 2020 18:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9EE6E301
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 18:14:56 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id l1so3257195ioh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 11:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HioE1Ic2H4+VI2tlTAqjw+Vj/lfG0Xa5PuxbG5eEH+M=;
 b=bJqLE1OTZDy6EWyYpbtU3uHwfpl40GxqWC9cXpwn20Gn6LsmvDRuLGhnA0/3HZJqSA
 hLxEj1zNnldzHyKG7BtXIYxHS4rYtuYkR9fVGHCdAVqzKYVUK+97pThFhW+Z7GuRw1Tp
 FG8FOU4g0mBAEK5Kgf1ZQsbORc8T2TmVZ5yvHZyRa1J0FEVdBqgDxproK7srIO9JmEes
 ve1W5ycaDdXXzF3j5Xlw7SoYUVzfAGSG881+LkmB7oEnFF/7Lp4cTAcKlSJfRzjxwB1N
 T+a5a0Wokvnh8pyNrTKoaSUHviUSigKDRjlqrcsuDaOTuPH9nh97MF4cQx3gzXnxShGd
 aIsg==
X-Gm-Message-State: AOAM531hes5vCPaZLQAWxcvcDbSDBrrk5NFD90+Hyc/Oo7JvOsQp4ai0
 MFw4EWoKp7YsvS/WZXGruQ==
X-Google-Smtp-Source: ABdhPJx3Mb+knVZxjE8+EeyPfsJnbWOXBKCBVw6kJBCYlciHGHqTLkg+OPw9KN3IpL0XN8Ryd15o3g==
X-Received: by 2002:a6b:f012:: with SMTP id w18mr543374ioc.5.1594836896055;
 Wed, 15 Jul 2020 11:14:56 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id k24sm1445391ilg.66.2020.07.15.11.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 11:14:55 -0700 (PDT)
Received: (nullmailer pid 549346 invoked by uid 1000);
 Wed, 15 Jul 2020 18:14:54 -0000
Date: Wed, 15 Jul 2020 12:14:54 -0600
From: Rob Herring <robh@kernel.org>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: add binding for Ilitek ili9488 based
 display panels
Message-ID: <20200715181454.GA549261@bogus>
References: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
 <4fb29a638aac966a0a0413302aab30193c4fb395.1592055494.git.kamlesh.gurudasani@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4fb29a638aac966a0a0413302aab30193c4fb395.1592055494.git.kamlesh.gurudasani@gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 13 Jun 2020 19:37:03 +0530, Kamlesh Gurudasani wrote:
> This adds binding for ilitek,ili9488 based display panels
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
>  .../bindings/display/ilitek,ili9488.yaml           | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9488.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
