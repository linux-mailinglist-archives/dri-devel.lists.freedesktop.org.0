Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D2262046E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0352610E053;
	Tue,  8 Nov 2022 00:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2283710E19F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 14:00:30 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id n83so12181519oif.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 06:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=El1l3/URPygZ6uC5Cno67FMODlgxZihuIegCrdnoogE=;
 b=FG6E6josrDOt8rJ5w+tMOa3p51G4lhAI5zSGWTkuig6e88TkJx2Yw4AzE45EBl+pco
 l61DNOulJu/wtv/YuQBTN5syUVE6dJtBXnS4tRWxl5vQ2Th+UPfomReq5HDNL+ZaxM4o
 5s5wBz+sybAK4WzshMQiFpKdicTVjljNK68OWzAcmoU3CZtvoGulnZsJ4ax6/8AzR1Nm
 DTD9Z2zMejFA3TWssBmLHB3ZDPPLTcaH4dohdjgo/pG/FEAJGYHHjr+fylb4Po3p6OXC
 TDtKehjmJ/izndtEtN5FqUaHhqCnb5K7i2bqLioDu51IsT9m4kyZDeL8hsikBUsUXD3j
 CLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=El1l3/URPygZ6uC5Cno67FMODlgxZihuIegCrdnoogE=;
 b=rHNNPhiEt7b+GgjsygWAQA8+ULfCU4/1e43AjsCO/V5k2BHow848YrfXm+Mpox/49o
 igB9phgFDqIYIEfKGOy7tMdUQCPZulXySZbuyLUFThByOQgc72mrxDhBohctNUUH2sZn
 zT6Iq6aGnSh62ay9vWQS5lkPxzb2Q4Y6C9lzNK2NaNcpXZ+Y9R9gkGunVdu9IPe15yrK
 JaXKtAjWpY5YEWwUV59TI6atDaLXap1Tbz/lboMvqsiz5dZkjTMegYe5jwsBx/ey5gJ3
 pKltX+6JZ2/u6YGLhRzOwIrQefY1SbQdJRBm4C+O9jnZLBWtR+rS5RJDQp7zYuYZTAqT
 tprA==
X-Gm-Message-State: ACrzQf0jsUEMOjDqFW8xZED4D17suvwoht51hPqbI8Y+CILCBIatG0S4
 mFWgVMu3KWolNABmnw9o2NTnJh5BsJgoO2UA5SNQeU4j
X-Google-Smtp-Source: AMsMyM68ZT9LtzBOQonbm2D0ZfRq7YxuMKs4ZVubEfr4d29POZbtR7n38Oa9cK5GaNZDIvOFsqjHhK5C71X/0icpx5s=
X-Received: by 2002:a05:6808:2017:b0:359:ea7a:5983 with SMTP id
 q23-20020a056808201700b00359ea7a5983mr26520900oiw.51.1667829629192; Mon, 07
 Nov 2022 06:00:29 -0800 (PST)
MIME-Version: 1.0
From: Cc Carnaghi <carnaghicc@gmail.com>
Date: Mon, 7 Nov 2022 08:00:00 -0600
Message-ID: <CAHhA7CtqEFE40J0qteXbQG6Sn57Xxha0H7kUYxiH2DTK3-rhTg@mail.gmail.com>
Subject: Re: [PATCH 4/8] pwm: atmel-hlcdc: fix struct clk pointer comparing
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000980e9b05ece1d822"
X-Mailman-Approved-At: Tue, 08 Nov 2022 00:03:28 +0000
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

--000000000000980e9b05ece1d822
Content-Type: text/plain; charset="UTF-8"

Mr

--000000000000980e9b05ece1d822
Content-Type: text/html; charset="UTF-8"

<div dir="auto">Mr</div>

--000000000000980e9b05ece1d822--
