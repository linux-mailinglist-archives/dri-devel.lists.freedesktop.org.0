Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC5796E411
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 22:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D840C10E94B;
	Thu,  5 Sep 2024 20:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J3/YxT+I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE9110E94B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 20:27:52 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7a816a9007cso237146285a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 13:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725568071; x=1726172871; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1ID4h32vMpKJpRELS7Wjz6ZK11jdarXsZHBRZ7AsCm8=;
 b=J3/YxT+I1Gr3EQkUp8ti9/n3mZYwVxAWT8dWZ9qlcH47LDzq0zpxpYotw4f7QxMKCj
 f/H1sZckw4he/3aGUl0Yi9OGoRItJsVVMGxx3ZoTB9HvJbVZsD5wCrrhUY+N5e9DmTc6
 kmSyQaDhQkhhROxAYYAia+zPzrRT3MqmkEM7u3G/GTOLfovrdxCsaA7pFLGC+gVMvr+R
 fi78ckC+JEOLXurfx8J9b95LKtErLoNm4yvSd/vsbL5lwh5JOUvG0TVSfi9AyxKS12dS
 joRTXN/Ez/wOfymmP4V+27o2UlbSZXVNZn2sw243OTWuBf1TgUSfQ1uyt+jQ/DQS5ana
 LUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725568071; x=1726172871;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ID4h32vMpKJpRELS7Wjz6ZK11jdarXsZHBRZ7AsCm8=;
 b=cYiktm3FHahU0ZUYmX+TasMuEHBxAkHm/UpRTq43diqQ+MpKkndm3rqdm/gYuTqk2D
 8YFdH/7aAyUvtXo0bIaNEgxNubhQ4E4NiCjAdNLHc7y6cUWqk2Q8CHJqz61opdYabUGx
 AUdvzctpvepBSs3wu7Zudq+9p0pBV6C1fq+khOLVX/qiKaof4C1ZM1fLw233T8VCjEN0
 DES2paA16GmprjqcJV2SvliwdB81UzqfOj7sj8N8hb+MthGLNjwtsj3kPX5RxH7YZDAH
 h7MLdeWGe9npPQqqIP45XxMbVY64ssCmtERnsetNPAnAv5EDMZqPH4x6BCse3MXH9MP+
 +4hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDsLdUD4/YZZ5mdqNRiwvmDE2VnZzLf132hHIMBMUVY/XthUHuJlIlK6XvZEFmMRf6owh2/bjJYnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZpy9HvLc5DOKX6IjEQYhhVw6YtQ4UxcVaXVNnWQImOYik0O0x
 sUb5scbo4GLMxP7ULjjkphlzB9VRI7XWV3f9/e4Qwk8vIzO6qeS7
X-Google-Smtp-Source: AGHT+IGbZB34qSMVQXaWXVGoFS+5k+r/7KenyVF92+5VxThGj7KDYCLvSxV5ux3DDhJjZvlE7MIaPA==
X-Received: by 2002:a05:6214:dcf:b0:6b5:2062:dd5c with SMTP id
 6a1803df08f44-6c518def647mr137814096d6.8.1725568071408; 
 Thu, 05 Sep 2024 13:27:51 -0700 (PDT)
Received: from VM-Arch (239.sub-174-193-4.myvzw.com. [174.193.4.239])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c5201dee67sm10610496d6.26.2024.09.05.13.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 13:27:50 -0700 (PDT)
Date: Thu, 5 Sep 2024 16:27:42 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>, 
 christophe.jaillet@wanadoo.fr, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Message-ID: <trlyhlclf74itbgj4x6baj6ga6yipdicw3c6odtjgxtbw3cjyl@lyfiny2yiz35>
References: <20240905124432.834831-1-lanzano.alex@gmail.com>
 <20240905124432.834831-2-lanzano.alex@gmail.com>
 <a4520c05-d64b-4ef0-823c-6c568b459e21@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4520c05-d64b-4ef0-823c-6c568b459e21@kernel.org>
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

On Thu, Sep 05, 2024 at 03:23:20PM GMT, Krzysztof Kozlowski wrote:
> On 05/09/2024 14:43, Alex Lanzano wrote:
> > Add device tree bindings for the monochrome Sharp Memory LCD
> > 
> > Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> 
> I don't understand what happened here. Your process of handling patches
> is odd. Tags do not disappear, you had to remove them, right? So where
> is the explanation for this?

Whoops! My apologies for wasting time. Nothing changed in this patch
I forgot to add in your reviewed-by tag.
