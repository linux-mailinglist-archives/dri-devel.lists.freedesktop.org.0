Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AA45446E1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 11:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC39810FCC5;
	Thu,  9 Jun 2022 09:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6EE10FCC5;
 Thu,  9 Jun 2022 09:07:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BADC1B82C4D;
 Thu,  9 Jun 2022 09:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C73BC34114;
 Thu,  9 Jun 2022 09:07:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="CKR58gOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1654765625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gmOmWUTa7mB+V1QNqk4MhdU8QLzvjMASINVmVBWbOBg=;
 b=CKR58gOT9f7T1d6HY0h1qBCNns6UYEoztFpmyi3Dx9BFUwsDFmA45QC8d2kqPau48/Ieb5
 V2vfNWPlIxVvWC6WXymiEfhJwjlkeGxK7eOWp8zQK2S7OYGDLzhJfcDDcK6XaMyMHQc5kB
 R/fbQoPU3Rnwqc+1bTYAucnfB1oHCjo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 77151aa7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 9 Jun 2022 09:07:05 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-30c143c41e5so234237527b3.3; 
 Thu, 09 Jun 2022 02:07:05 -0700 (PDT)
X-Gm-Message-State: AOAM530Fe9OOl11axl7GhHTz52hd8gjTWQXRWu4SdEhWHOVXELkFHsKP
 XirJ/sZhG5qIM0ihHxB4DfbTYh5VbScsat+akUc=
X-Google-Smtp-Source: ABdhPJwwHpdIgYm/BLNyphpf4OzlzTB+K1H6GMcnWUzLLWqqFNED/F4IKScV4Hglfax6v6E8iuB56O7VADdkM8UmadQ=
X-Received: by 2002:a0d:cd04:0:b0:300:4784:caa3 with SMTP id
 p4-20020a0dcd04000000b003004784caa3mr41463549ywd.231.1654765624924; Thu, 09
 Jun 2022 02:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9oyjj2cHjyqUrDQHQ1+YBafhBvj0utpU4kox6YK0gcT6w@mail.gmail.com>
In-Reply-To: <CAHmME9oyjj2cHjyqUrDQHQ1+YBafhBvj0utpU4kox6YK0gcT6w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 9 Jun 2022 11:06:54 +0200
X-Gmail-Original-Message-ID: <CAHmME9ozb+4e1Uj-ETPbABt_hr-ppDeHu=tSB-B50TGFnfXMFw@mail.gmail.com>
Message-ID: <CAHmME9ozb+4e1Uj-ETPbABt_hr-ppDeHu=tSB-B50TGFnfXMFw@mail.gmail.com>
Subject: Re: i915 w/5.19: wild flickering glitching technicolor pyrotechnics
 on resumption from suspend
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FWIW, I found that reverting the two drm merges (with `git revert -m`)
from 5.19-rc1 "fixed" the issue.
