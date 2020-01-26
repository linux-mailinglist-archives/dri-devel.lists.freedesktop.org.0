Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0711D149C6B
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2020 20:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4826E235;
	Sun, 26 Jan 2020 19:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8F96E235
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2020 19:05:32 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id y17so8294562wrh.5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2020 11:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zFQp92vUJLc/gsIeoed6RGerNUqocJoVfARrB5eWR7o=;
 b=EF+HBmSe0vksk1PWa/hQFZiFHGBC6d7g57RE6CpKtnU1vG8SWx0jJds89Ra70sy0gM
 1gLaLzvdquSjinsdK9IFd+ezSIUl6oVJy4rI7cQpMx9nsoK41ns0LpKXuDICMynkl20z
 UiR6u5XKvNeSeu4kikR0AxeiyrdDvfV9MIY1+Hg/wUKnv4ZzBjKu2X/Gq2HBN4CanRnd
 WXhWn+WmgoePPSULubKl7NobkLPww2/aI7SvgjCBAcGQnNItBeI29FD2Ef9Bu4fTXHV8
 k06CtwKlffCH/vCjk1TiATnVLgNj7GoBw2OzNhyEADHeXJs8ixYkgpsfDioUGonKS370
 owgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zFQp92vUJLc/gsIeoed6RGerNUqocJoVfARrB5eWR7o=;
 b=c8X9nN5uPPc8V4RIjFzZpBTqSQNbDHVQdHbEMcwXnk7HFzFZrql5mi+guZuGZCPI53
 bV8bpCox1Fe9sriwmZ7YNGWR/stO/Tv8iXW9dYQ8aQQ8Yq8s8cXEhNE9kBWpAgh/yGt9
 uA4w8qkGIraMJkPhnxkoloOpd5A0r73xqD/ylCm5fNBrGeySuHxE9tvsXmUA770GspuX
 phnnHBL8p2ofum79aK1n3K/1+uxrNmD4HmgpgM75u4p1OIGgo+ZCCKC5edSo3YMEVI8x
 q3JU3HkhOByCEFJrcA0eo28NRl7Yx59azuvt+EDAAftkL9B4dGHHIga3YO+4Us5k80H2
 bmLQ==
X-Gm-Message-State: APjAAAW0MG22XwL6RDT2JzyrHnKI45MIWDghtCfxyuSrUx1eYSVSCWVg
 MlYoNYfCG2orgNjzODjFskYoMWra
X-Google-Smtp-Source: APXvYqw8AAjy/SyLbrW6N5blEFnkJUwvL253LjKfwM7BuUhi2wJkmEceHwd53YKrjlfq8Auh0xZI8w==
X-Received: by 2002:adf:b605:: with SMTP id f5mr16092202wre.383.1580065531328; 
 Sun, 26 Jan 2020 11:05:31 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id a26sm6185465wmm.18.2020.01.26.11.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2020 11:05:30 -0800 (PST)
Date: Sun, 26 Jan 2020 19:04:38 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200126190438.GA19178@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-5iVoXe58m1@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-5iVoXe58m1@https.bugzilla.kernel.org/>
User-Agent: Mutt/ (2018-04-13)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 24, 2020 at 09:47:44PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> In other words, this presumes the shaders submitted for compilation by dirt
> rally engine are different each time the game is run ???

It may be related to the brand new mesa/src/gallium/auxiliary/util/u_live_shader_cache.c

I don't know the inner details of this (I stay away from anything GL), but it
seems there are some GL shader usages which which will trigger a full
compilation of an already compiled shader.

@alex, maybe that's what you were talking about?

As I said, I may be totally wrong though.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
