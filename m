Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DBC1C5318
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 12:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645286E160;
	Tue,  5 May 2020 10:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789846E160
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 10:24:28 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id n11so1397046ilj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 03:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=D6i4p7Fh/eDWcxFvLGiergDm3ZkIq09uPkkLMUJp5Ro=;
 b=TXb2IHTREDQ+eUFMcguqlpyMcQK4f+lMJy2j0XdBEe+S+7xstgh/CHRMl2EbA03Tj+
 NqOAMp104Dk6QS2AQUHVC+xW3/qCr2Orcvq34rgrdWIrLWJyNIH0pRl1qLCC//DVv+pQ
 ORFkbK/lg4OpumwSNqtbgDqAUIJ09sYyYOTTFkIKhjqNEZtno/O+gdni5vBjw57k9Iz6
 ++enKcZtz9NZjhweO9bgK/HDivy9rsLq6JIpS58TArt+ExXTlltDU4CNNpgLLwv20BKv
 p2HB85P+XRMziZ9+K8NXsU7q7RWBC+54Q9YZ6cCK+1L4iKbqY9PDwNSd0VbOjxY7aST/
 ZNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=D6i4p7Fh/eDWcxFvLGiergDm3ZkIq09uPkkLMUJp5Ro=;
 b=GK+9qHE9jTqvXZZdMPFcxOqOzXjwQ6Xhk1KbZ8sZzrYYneF20+fQ6uFEC3tZWhVuvo
 Fkx8a0GYVwZ09JKDm0dsujl1bw5rAo68VoUjqg7j36LnN1W60zEtqpSBP6Y3kRFEi77b
 NXaMD7FfvMPe5cN8WlwH45UJhVYTVa8mkDoC8FZB0e62LcGU9/C2ZBZyVkjSFtjvI3Z1
 dEp+x5Ry/1JLCx2pliFCLmwx0JlYJr0Y4bUQDF167PoSpsoT0DWSG1wY8VQUUPL24WR+
 /dl9OAs4oTFIIZ7zfd8in/WMxlZOtTWVpj1FTVr6YYQP0wo2yzSWtu2VlGw4xnHoo0K/
 ffpQ==
X-Gm-Message-State: AGi0PuaLzeD1cApryBd33yZOPXD3C15le46sIpO6EyXWGLfjyEo/YNBo
 5VBxCd8lVFeX0YkqbCdivhGcShqiE5QUZdL/pRKQvseFYnc=
X-Google-Smtp-Source: APiQypKXw6jQ/AMU7pEjR6JWCAvADv4bdXkcvelPBKAskKqiJvU4wUaXqE7DPrGRBwtdi00pdWa3Q9PKfeq+ZlaTL+A=
X-Received: by 2002:a92:3dd5:: with SMTP id k82mr2912067ilf.237.1588674267474; 
 Tue, 05 May 2020 03:24:27 -0700 (PDT)
MIME-Version: 1.0
From: Artem Mygaiev <joculator@gmail.com>
Date: Tue, 5 May 2020 13:24:16 +0300
Message-ID: <CAJwc6KtGT4+Y2jT1fxzYrkcqvkxgs9GGqxT-zZtj6ktRf-67jQ@mail.gmail.com>
Subject: Question about sRGB framebuffer support
To: dri-devel@lists.freedesktop.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello all

I am currently working on DRM/KMS driver for Fresco Logic FL2000 USB display
controller [1]. I have already implemented a POC driver [2] which is working for
me, although there are still plenty of things to improve or fix, of course.

So far I have one thing that I somehow cannot find in DRM/KMS documentation or
existing drivers: how to tell the system that HW expects sRGB (i.e. non-linear)
color encoding in framebuffers? This is a HW limitation that I cannot influence
by configuration.

Any pointers are greatly appreciated.

[1] www.frescologic.com/product/single/fl2000
[2] https://github.com/klogg/fl2000_drm

Best regards,
 -- Artem
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
