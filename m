Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302D77DC5DA
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 06:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C28B10E3F3;
	Tue, 31 Oct 2023 05:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F71010E3F3;
 Tue, 31 Oct 2023 05:23:17 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5401bab7525so8877786a12.2; 
 Mon, 30 Oct 2023 22:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698729795; x=1699334595; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lk7kw7SPl9v5EILcyTZyqEK/ludz4eidJN89WNUO9p4=;
 b=PF7Y0DxzaaIZ48/PxEMivciS+WMYwLu7jtJGa78q9aPJ6u7uo43qQ9wcv0V6a6I/OW
 WcQEGBal3SiiikTxanXu07/PIWnI7GdKVzj4kKU2p2vckcP/p7yfL5BmQYZSQFpuX3ok
 owGdHTicKkpggmfg0KfC6ur1uDnNkmBIJ9rnjUiH9tfgUCXQORbSBblvoU4beGksFwJH
 Cpzuv0kGH72wt7vvix5rZNEJYBjnUFNxkpKwy3NEzT+0Qoo+jPWm3kKU+M93PKcCHsqB
 Jawi3+CYrvK1pCiUQjVfvROwvfjNtSui2MhDa/a+cvB3xyNPGK+e48Essn+f7+gwMiz/
 M6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698729795; x=1699334595;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lk7kw7SPl9v5EILcyTZyqEK/ludz4eidJN89WNUO9p4=;
 b=P6npwmztplvnY/ak0O6vNQDCH+yYswpTPg/Q2G+goK5i0nm0De0hiIbwu1nZ28vEVP
 jvitnyDJGUSbVNGlAI9O1tQTsb75JQ39os/RRzLBRtKB0GavIQw+xAHaLFgOG0y03Msb
 gBLyMb3azR6LSPQsP8pBSYILWOJrn2jFra66X2tyQHWr34lus0EMvaPivLA083WYpf01
 whSNB0fQm19+LEBNKfhmTeF/E7vNfuIVJzcE9Vwx0SFmNuq8LQF6jyLjHn7jqRfH2Zv2
 67Bv9cMIF15aFtZN8Xse5Clhsp+pBBs3c6R+BjBdAOorF2mAjj2C2QqKEfr12XVonNtb
 hdHg==
X-Gm-Message-State: AOJu0YzBvFkXTGgAj2e8/gHZMmQgkXSsP9o/TFby9yy5gtFS+3BvAl4m
 xrEW8R7JCQv1UJ4nYOapsx6iLDSqDd0J2ixnMuE=
X-Google-Smtp-Source: AGHT+IHyVG+6nj8tSZPsOiIOhfNKgR/JCr0XldmJ55bbTbF3uUo0zogQAGz18+ZzIk+qurQKXRxarzY2FeMvMYkSqlA=
X-Received: by 2002:a50:9f06:0:b0:543:7c94:3a91 with SMTP id
 b6-20020a509f06000000b005437c943a91mr69265edf.6.1698729795369; Mon, 30 Oct
 2023 22:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <SJ1PR11MB61297BF7764AF1207571A872B9A0A@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB61297BF7764AF1207571A872B9A0A@SJ1PR11MB6129.namprd11.prod.outlook.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 31 Oct 2023 15:23:03 +1000
Message-ID: <CAPM=9txw6gYP+GoBvMBCWAP_W6_LSYg6SnHXQ9w1EjxA0UoOvQ@mail.gmail.com>
Subject: Re: Build broken in drm-tip
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>, "Kurmi,
 Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>, "Saarinen,
 Jani" <jani.saarinen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 Oct 2023 at 15:09, Borah, Chaitanya Kumar
<chaitanya.kumar.borah@intel.com> wrote:
>
> Hello Mario,
>
> This is Chaitanya from the Linux graphics team in Intel.
>
> We are seeing a build issue in drm-tip[1]

Sorry that was a mismerge from me, let me go fix it for summon someone else.

Dave.
