Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0F943F468
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 03:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD15F6E03B;
	Fri, 29 Oct 2021 01:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B326E03B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 01:36:44 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id bm39so628764oib.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 18:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rEUKq4H/q1YXode0QYSe29a/fljPe3IY3S8bjoBxkQE=;
 b=cRPDz9KS5R8pcSfB98eHE60Ofas39uQpFSqlEb5iSSAXECNYn0mCzZBQVP8j2JOMoc
 FTzzmoVdzJw6IQ6Q6OojEG8t6u2PlyvTH57hMp38kneHgDrkwilwlEpG8qnnhg5ZYAPT
 LzU570+9nlhK5T6hELFVXy6NW3Gfeh190idAwAEpQYjpdKSlQQVXuTXt5qU+1nUufJor
 AHf6iK3jSGZfs6PRG4Eh4dO0hBTGPgx2rYJhzce9y804RM8043L9YiwXCDtU9R0bXMEb
 j14pI7kFTAIePEO8QPdMwcqpodTpsp0OtkWfJjSPIYgr/Hg7QaQO3AZP3EyjStnpPaym
 q6tg==
X-Gm-Message-State: AOAM533jB5/tSPXn1kuX69WyayezIje7dfg1zt6qJbU3gLgNu9U1XhIT
 846Ew663bOC0+HI90FGWl/nXEi0nqQ==
X-Google-Smtp-Source: ABdhPJwIHn1nKBNsS1QmZwcUTe9OKaLhM9UXWPtSWb6HLBiBiKMpoaGB+U4NF8qqP3AazX8vaBHFdA==
X-Received: by 2002:a05:6808:243:: with SMTP id
 m3mr6022576oie.14.1635471403392; 
 Thu, 28 Oct 2021 18:36:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id y10sm1573730oti.40.2021.10.28.18.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 18:36:42 -0700 (PDT)
Received: (nullmailer pid 966805 invoked by uid 1000);
 Fri, 29 Oct 2021 01:36:42 -0000
Date: Thu, 28 Oct 2021 20:36:42 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Tomi Valkeinen <tomba@kernel.org>, dri-devel@lists.freedesktop.org,
 Jyri Sarha <jyri.sarha@iki.fi>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: tilcd: Fix endpoint adressing in
 example
Message-ID: <YXtQKoZvqH9/X/uK@robh.at.kernel.org>
References: <c58b9cdcd09cf669bb63cd9465d0f75dd66e742c.1634822358.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c58b9cdcd09cf669bb63cd9465d0f75dd66e742c.1634822358.git.geert+renesas@glider.be>
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

On Thu, 21 Oct 2021 15:19:49 +0200, Geert Uytterhoeven wrote:
> Remove the bogus unit addresses from the endpoints in the example.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!
