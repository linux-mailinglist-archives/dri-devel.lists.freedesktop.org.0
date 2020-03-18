Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DE51896DF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 09:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4444F6E87F;
	Wed, 18 Mar 2020 08:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6906E26F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 02:18:11 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id h35so5781525uae.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 19:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xFrUk2+Eyc785NzJHh9AqDzcXv9ntwKnSngSFLs9xi8=;
 b=n5hHTwBBcpJ/DhiJ0y8sCfIgYABNVBKH+0R/SfE9l8BL8B5xMBfnI6YgjR+wzsREdg
 Hgsi8cQ6SdUDcqH0HpZ7ZJ67OKpMsMH0iTFZzh4MJjCen0flpUrX/zws3ntTEcH3XXp7
 GXLRJAOQNwDuWHO8wvg93grbYyIdVENi2148n+NNDOHKcSsRHsO7fZTSanfyosCHNvQZ
 ho7lwFCZzwrFdG3on0rp20Ad9R5pixgMRkqHDn3h58eqNkt0StT0Bnf69gI64mBGmP04
 hqqfBtvhInWfW98uHKzrUEovWInbdNv8VcfPIHWTukTcdbrAhJ/vV/qf1O2hNJO0giIj
 x9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xFrUk2+Eyc785NzJHh9AqDzcXv9ntwKnSngSFLs9xi8=;
 b=SvmtT82Ztx7zaGQnDrjgWuSkU0hll0N4BHKtu9y9rIk33CjlugjZtHVkkw6fMKTGGI
 hSP8fe+jUfmLfMYg5tTqD8ZMJqx/Up/AgAOYj1ZHgrTD3ZVc9iYupFrLRnrvqisW8Bs1
 PXOuRnHZEq4JejckOSn7rvEf/7o+AQY2QNXxi4A6iVI+Vw9YmZdPISzXZD6Z3x/3g5cE
 ouVeA4MGuFYpmo1SYJyTUVnT1ajTPfX6rZrQIfjj8bTGo0aYogxNgjfzLLnRNmm2HbbN
 NTgyyiU4IFIyad2rOFtu2RuZ+vm30VX3Wpd5bxCAtN0oA9paLYNcs5MmrBbbmUNhqrdE
 j6fA==
X-Gm-Message-State: ANhLgQ0qhl3kW+lPFuN3CiWJeSYeIygsLmfrPd+KQI9J4BxPmvXfyXeB
 pNQNVf5coSTA31vOIJkS/0M7r9XXzlsxrCjCzKs=
X-Google-Smtp-Source: ADFU+vv+fzarl6HBXznz/RGpx9z4idfZfOZzHi1dpALbSJXjR4Y7T1Fg9qqnf5RDzv0ldp9Sv0R8L8WCGa99rVX2bHs=
X-Received: by 2002:ab0:2e91:: with SMTP id f17mr1402878uaa.22.1584497890758; 
 Tue, 17 Mar 2020 19:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002e20b9059fee8a94@google.com>
In-Reply-To: <0000000000002e20b9059fee8a94@google.com>
From: Qiujun Huang <anenbupt@gmail.com>
Date: Wed, 18 Mar 2020 10:17:59 +0800
Message-ID: <CADG63jBhCBf6r8vfT6kCwh7shYHKsuGH=Mx8D+hDxO0C3Urjqw@mail.gmail.com>
Subject: Re: WARNING in idr_destroy
To: syzbot <syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com>
X-Mailman-Approved-At: Wed, 18 Mar 2020 08:24:31 +0000
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
Cc: airlied@linux.ie, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

#syz test: https://github.com/hqj/hqjagain_test.git idr_destroy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
