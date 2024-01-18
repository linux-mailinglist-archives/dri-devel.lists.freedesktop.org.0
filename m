Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B58831D12
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 16:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2544610E837;
	Thu, 18 Jan 2024 15:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C174110E04C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 15:58:17 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-337bcf021a4so2047900f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 07:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1705593436; x=1706198236; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uGHMTmptTWhx7mtMR0z1lDg797+uffSYth72fUqvvpY=;
 b=XHJ0tQH3lQxWT+htv8vRxv++if0vyvEaHbLyk2n8iscQVPPst3QMj3Rn/oK3Otedc7
 mPRv9VhpZq8vd3/+Y4KUaze3mZUQpJmTUHZW37z8NDkEBqPsPbAHGu/fCouE/WTnHdIz
 SKILT/4HBOvr+Pjtksl1MuTDUoyID9icVZnUuUMAaeWoA/eDk1PdxS+/7yR+LS1GZ3Bs
 jZ45wJXwpQDhy/wXEbdR6mWSGXmwiKTmicOy20siLn8dov9MU4bS3di1jl0Dv3+6W+W9
 r6+e/3eGGOwhfjFf1cY8OX9MrphlCrYVDIkDq4QlJ8cpDQdMlfi0BURbPQ3b+qER8Ikp
 sykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705593436; x=1706198236;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uGHMTmptTWhx7mtMR0z1lDg797+uffSYth72fUqvvpY=;
 b=hJtv+vYW/L3JmojZ7b/e7tjK9OEe/mvDjiZAvPUj7rEnwoR/DyVDuFkbri0a/m9aXy
 2Sti1rkJoumOHTtdbGTC+vesisxLN3uWQZXWpv//eJr4aMlwfnuu2l2pXBtGR7oU9KUG
 /GBpchbkbv4oJgHGrAaGNPDiSIwFr+6RPubr3WMi5u378MQmLg1roPRLQHTG+JW+6asB
 WGMW1kiiEhU0I/aGbCNfAFQiZ/EzyQX/hwJFEcPlY/1ALCxaEvh5bPhfpS7fCfMSwM0Y
 rsU0Dmbs3FRlBIqkhz1B7QUjqkuGtmkkAbPyfhRJwA65TcIjX++7U6XR524rvayE5GU1
 sE3Q==
X-Gm-Message-State: AOJu0Yxsg83VcqoYCeC17lKftD0N8CxjwGKSanryj6pIBj917jjWqnxx
 Epa3y6/5HEKnKQQmf7UP90w3DG6hHYtAAs7V9k3syb9CmghsP3uxwnLCAhBIEFlVVWQ0GK2Jdkj
 Xu3U=
X-Google-Smtp-Source: AGHT+IEcMItgOfr6kW8bJjym445sWFt3zYSCvrDxpjaY+9mfPw+txESZxlWmJyJurLc9bsUPdqTMoA==
X-Received: by 2002:a05:6000:1885:b0:337:c5fb:c84f with SMTP id
 a5-20020a056000188500b00337c5fbc84fmr882828wri.33.1705593436027; 
 Thu, 18 Jan 2024 07:57:16 -0800 (PST)
Received: from suse.de ([81.95.8.245]) by smtp.gmail.com with ESMTPSA id
 s7-20020adff807000000b00337d735c193sm565612wrp.49.2024.01.18.07.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 07:57:15 -0800 (PST)
Date: Thu, 18 Jan 2024 16:57:14 +0100
From: Stefan Dirsch <sndirsch@suse.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: Mesa >= 23.3.x and python 2.6 ...
Message-ID: <20240118155714.mgcn5infkaq5usl4@suse.de>
References: <20240118123752.bl3qss3qbbxgvpdk@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240118123752.bl3qss3qbbxgvpdk@suse.de>
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
Cc: mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 01:37:52PM +0100, Stefan Dirsch wrote:
> Hi
> 
> I noticed that with version 23.3.x Mesa no longer can be built with python
> 2.6. It still worked with Mesa 23.2.1.

I've meant python 3.6 of course!

CU,
Stefan

Public Key available
------------------------------------------------------
Stefan Dirsch (Res. & Dev.)   SUSE Software Solutions Germany GmbH
Tel: 0911-740 53 0            Frankenstraße 146
FAX: 0911-740 53 479          D-90461 Nürnberg
http://www.suse.de            Germany 
----------------------------------------------------------------
Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
(HRB 36809, AG Nürnberg)
----------------------------------------------------------------
