Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BDD1BBE0B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F128991A;
	Tue, 28 Apr 2020 12:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FCE6E0A6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 19:57:53 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d15so20395904wrx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 12:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FAFnBP2ri+GLx0IPhRYr1sO7AV4T96D25WQDRIuOapU=;
 b=i9N+L5t4dZJWgMhTZSk+jwZ9vN3iyvpSGpdhulY6BETZ+7qiQNkS5B727S8fivSAG9
 HOvhDbdtSBUFshTeq+M4T0rxw7AQM1ZM8WiOKGNhSwL8VWHXvFuNErj9kwCuTE1howhn
 MaTnX1jS7i3GvvqW0uNVHYkc5JlcF0A7aCcdtbq8oDM0QwGBiLK1VaHiutIcEjUIcXij
 Nckq//wd9JMJDnLySQMyePecnyMzvcu25xonDFcSHbefV3B/ioKF9uPyUHfzvHovhm/I
 qjiAhC6rw4gFly2zKJuceRmT06LJXgOF2vsradlxEF4mevLsnHHuRhAhSmWxAN4fgmuy
 88nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FAFnBP2ri+GLx0IPhRYr1sO7AV4T96D25WQDRIuOapU=;
 b=eSj8Kodh7bKFLMpX5w7YnB/kaPtO7SDft5E1qcEmt2TksVX+bFdgFj7/ZwyzLyeKYZ
 5hrowBHHuoiVdShzT1RSbDZU1+tiTbujywsqYr6/1RHMVJqMvpt4izyfpElIz2v5HNTA
 gx/fMaovWZGknKjZLeQIH1gvoHjMJErDB5bKoj9eDClNW2a+Y9yb4/0JmUjdUjuN4SBw
 q+fS4TBXNxtkRUX19A+wt/KvspuzWOxHq/FRkJm4b+VMcrkFHeZlqBuNeFcGazrI8O0R
 mVGeKzIUjGEGspjAQqOqbk96xAs3hG3bbWQsTmJrMcPTv8kGJFvW9WmzI6mwifhsZH2p
 tpwg==
X-Gm-Message-State: AGi0Puax/MJf7BRH1LxurCxvQ1fzGQ5ZkJ0HIXe0OIJzvB6xM+1hjW2W
 iZ+LkLSsvjxLBLNLpsujmBHpUbs7NcboAPRo+M7cFYPT
X-Google-Smtp-Source: APiQypIxLUpfZB7yypw4e3kwrZ1vigzkzrGJzh0oih3hrhLoJlF5ZteGNx0VYUwQQq2pkvjfHN0zV18MoZCm7/FZUzQ=
X-Received: by 2002:adf:e791:: with SMTP id n17mr31008904wrm.217.1588017471682; 
 Mon, 27 Apr 2020 12:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200423223459.200858-1-pcc@google.com>
 <CACvgo50xnz9g8PE6+4FxHr=NJ4sWd1no4erFBJ2RY2msE12PYA@mail.gmail.com>
 <CAMn1gO5i-nBU_S-U896qrYYOUU6W4yD=KG8KTwijUOF62ts36g@mail.gmail.com>
 <CACvgo53CGO-gM8xEyP92La+3KEPWGGy3V1+YsQ2hrCt+atMnLA@mail.gmail.com>
 <CADaigPXW-2+YPfW8mayJPo8OoRB2j+VN=q6zu-cs0gmpXtjang@mail.gmail.com>
In-Reply-To: <CADaigPXW-2+YPfW8mayJPo8OoRB2j+VN=q6zu-cs0gmpXtjang@mail.gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Mon, 27 Apr 2020 12:57:40 -0700
Message-ID: <CAMn1gO4NsAoBUN4VFntB+pZK=cVCmwxBGUyipLPYYWFvpH1Z+A@mail.gmail.com>
Subject: Re: [PATCH] drm: pl111: enable render node
To: Eric Anholt <eric@anholt.net>
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 27, 2020 at 9:48 AM Eric Anholt <eric@anholt.net> wrote:
> If we want to go the route of "kms-only nodes also provide a render
> node interface for doing swrast on", I think that would be a good
> idea, but we should do this at a core DRM level (probably "does this
> driver expose dma-buf? then also expose render nodes") rather than per
> kms driver.

This sounds like a good idea to me. I will send a patch shortly.

Peter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
