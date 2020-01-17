Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 124691411A5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 20:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C01F6F8CF;
	Fri, 17 Jan 2020 19:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8406F8CF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 19:27:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z7so23761219wrl.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 11:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4BkamzDAKHog701ZnceFum/1uYaG64wCZEQBsYErSzo=;
 b=nCcuHhtSXllXAolnDh+u4S3ZoMy6JIPZnpuiRoG68S1YHuLKEVq/9rZ3BYDNhAmEbd
 mygdXntWOcNOWBZ/W3RdobH66cM/YhN6LCYsLBvIQXtS8Kwq3/LKL4d+NRHxPvBNxxeA
 QWNFINnSWlbdjBJ+GE0Nv5d7BywK9u+QHssWXcja0CQ7ENZPh6YqILM2Iwse7ZKs+HDf
 Wjn/fnkOD33tfDU/M8wCYbF2lo2UD5HUTcCh1liUKeUFyFtha3lxPIpKAgoWmzghAqeH
 J/sFJwZkygGSHuyhqWM/P9JtupGhGOtjvl3jmaCrV021cSK+SlGXukDJyOq48I2CEoz9
 Nbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4BkamzDAKHog701ZnceFum/1uYaG64wCZEQBsYErSzo=;
 b=IDNr+9bqnHnnI1Ek+mGN3SMklm8MaKFC80wxzUOSS/owkEzRPT4qeiN5cvRrRsBmzY
 Z7giOWo8MlZXDwQ0aBMD6ZdYPmQhMCo5Sg0twKIuCgzFX5RbAQ+IRDW04cD3HCp8bFGU
 zDed67c11+NTGbGS7sjmiQ2FRaoqYkY/OF5Reh8Ym1C4xa2sUYiMpK25sQCaslEh7Ogk
 GNBsLii9GZ+Kxas/pbrNeZaszE/TQLYTlwQefFAPEBXG65TMVKm1zE+cbaDf8DR54uFT
 vonqiRaaZoiDYVX4gKdMUy3qkD0tdL9VFf1Fr2Hqwz628KgLrOy51xdB2DWNbON9GfMo
 xZVg==
X-Gm-Message-State: APjAAAXieYDArG93c/GhDVUvyDidFU8+TWGNeZGC3QFpNZHPtp9mlxCu
 xwmQ8fkd2khy1+jHt8YTiZfYOWiD
X-Google-Smtp-Source: APXvYqwHnRlDkdi6CQdr25XJi06L2TpDPyjyjmSgdsRVNvuQvVa0OLrcnf8V2KQiHkTBTgVQc3lY3A==
X-Received: by 2002:a5d:6802:: with SMTP id w2mr4665312wru.353.1579289225557; 
 Fri, 17 Jan 2020 11:27:05 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id f17sm1599524wmc.8.2020.01.17.11.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 11:27:05 -0800 (PST)
Date: Fri, 17 Jan 2020 19:26:35 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200117192635.GA3904@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-XMqxm1Mcwd@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-XMqxm1Mcwd@https.bugzilla.kernel.org/>
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

On Fri, Jan 17, 2020 at 06:45:28PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> screenshot : https://i.ibb.co/PrHj3hV/tombraider.jpg

This seems to be from "shadow of the tomb raider" which I don't "own".

Do you "own" "rise of the tomb raider", the previous tomb raider game (which I "own")?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
