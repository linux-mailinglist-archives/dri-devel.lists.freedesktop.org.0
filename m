Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7009F15369F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 18:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5628D6F8EA;
	Wed,  5 Feb 2020 17:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4749F6F8EA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 17:33:13 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s144so4978502wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 09:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NIXMdyM17Vsgu9U2iF1Gocz/YPTIf7hG1iqxFJ4gHAI=;
 b=FctQ50s+mHPbIKaYqZLTne7iMJLshLxVUVsoC13d213XD2FA7MFAWI3O4Y4x64q0c9
 Kk8If/3aox6gaNtk2V8inZ5wJ1Olf2IVG6w/ZQWE8Huwfb9EmdnMVFxlWALewuSdDQT5
 qR1nSJ2jLJ/DjstxTtb5NjKM0gDtzmWIBvX8tiRT/hR6BFlQ3sGNK8PfcFNbcGc/W2hp
 ZliU0WoL1mvLPRoqF+Vs2aCW11iMF7YyCeh7y/Y++YVummPCDxRLSnhjrdIA3JjRaI6i
 O8UcEf3xdA34Afjz0e78iZ8ToHqRJVgGotUeeUJ9UzRyOIGt6HpbrhFDKUdNEq/VfltY
 hCLg==
X-Gm-Message-State: APjAAAXA1Xf/wzILytIBpEitpmaGQ7SvBIAsnEAxJkT2j04hHwYBmMCe
 WzRpyungFmfwtt6P9SE/Gg==
X-Google-Smtp-Source: APXvYqx3+2W+cyvAcOhXugVfztjPGzLY93MUdM73HQ7///RVqRrqQvMvrFeRIzWNzJm+AfMJ5rSu4A==
X-Received: by 2002:a1c:6755:: with SMTP id b82mr6472269wmc.127.1580923991972; 
 Wed, 05 Feb 2020 09:33:11 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.166])
 by smtp.gmail.com with ESMTPSA id r1sm658791wrx.11.2020.02.05.09.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 09:33:11 -0800 (PST)
Received: (nullmailer pid 3137 invoked by uid 1000);
 Wed, 05 Feb 2020 17:33:09 -0000
Date: Wed, 5 Feb 2020 17:33:09 +0000
From: Rob Herring <robh@kernel.org>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: add vendor prefix for OzzMaker and
 Waveshare Electronics
Message-ID: <20200205173309.GA2474@bogus>
References: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
 <aa8799c4164b54fa5c4ca55e48966d7b61352c2c.1580134320.git.kamlesh.gurudasani@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa8799c4164b54fa5c4ca55e48966d7b61352c2c.1580134320.git.kamlesh.gurudasani@gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Jan 2020 19:55:33 +0530, Kamlesh Gurudasani wrote:
> Add vendor prefix for OzzMaker [1] and Waveshare Electronics [2]
> Both are display manufacturers
> 
> [1] https://ozzmaker.com/about/
> [2] https://www.waveshare.com/contact_us
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Applied, thanks.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
