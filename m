Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1437E27E2FA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 09:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9426E188;
	Wed, 30 Sep 2020 07:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5C66E4F1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 07:17:02 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id o8so463545pll.4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 00:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HvB5WWDeCpx4UxR7469lckPwvo+OJ9mvkcjL6Dnh5Es=;
 b=cz3y20djppMM1e+O0NQd3T9TUu175fFor7dMRlKW8evtdkP9ij7Mv6pVrnc65HDa5l
 IiQRZrbfI2PBy4HxXsqRJwldR8nks5NWfJ7JDpt3gOenJzSo+0ku7py9qj1pfGDgDgX9
 hIZg1E1/NuZhV5AvDsOwcnvQZpQaUcJ7tyc2gAtbz6zH961mwlViPt3GDRUMxyq3F/EU
 DPIFjE/6lkd37HnMu//PZ7awQl3cpq9S6UKS+SZci6j7avpbUUcsL2mV9dbxTjLHr+0N
 sddd6G2EBO++3ivQbQQe+CGLjpIAzIdbR4z9UbN9RgsfAt1zFPsWV4bfRI0x37hDid9d
 /raA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HvB5WWDeCpx4UxR7469lckPwvo+OJ9mvkcjL6Dnh5Es=;
 b=UewVW+JT1b/fPZDnp6DRgY1jfiC52EKCcHPqsueI7iztLMO1P8lvfNTK+ROYvv5lGf
 rVLOtejqlwlv/n7fuYlZ7I3IBAcWJPtJHHWDRteFiIznECv5b8p65nur1TycxsPpQ/P4
 DOV6zIjLtoO2nHxi7iYRE1MYhmW9HNimsdQC9Dr5f2OWeb16dQmD3GSWEd+59Qi28MZh
 AYZ0wd26Fy3Hd5u7CT2gkrBiK2Kq/SZJw4in7mP5qq1AaUYKc6pOC7obeREMvy8D3Vi1
 nP+4eBeJ8xwvhD4ikGDM6XmF9KsnZYZnVQitXCgWY+iT41ZQxePk/pKau1ctgOzXXun5
 u9QQ==
X-Gm-Message-State: AOAM532d3MSg9LXVhObnzfNzPs+gbZE5BbVOnR1TkHLDEGIVXhMlu4h6
 s2TIeECHrDRxHmqNGHaWHA==
X-Google-Smtp-Source: ABdhPJwwhqS/oKgZ2gCgTtB/SwDO9Ox+IW1ZuQUaTukVj7RoNvgQyRu6dyqlZGMOEx3c95YBXvzTtA==
X-Received: by 2002:a17:90a:9704:: with SMTP id
 x4mr1361295pjo.20.1601450221896; 
 Wed, 30 Sep 2020 00:17:01 -0700 (PDT)
Received: from PWN ([161.117.41.183])
 by smtp.gmail.com with ESMTPSA id l10sm1034278pgp.25.2020.09.30.00.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 00:17:01 -0700 (PDT)
Date: Wed, 30 Sep 2020 03:16:52 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200930071652.GA1152625@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
 <20200929123420.GA1143575@PWN>
 <7d341242-9612-d0ee-4b79-e93882fad73f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d341242-9612-d0ee-4b79-e93882fad73f@kernel.org>
X-Mailman-Approved-At: Wed, 30 Sep 2020 07:50:09 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 07:26:52AM +0200, Jiri Slaby wrote:
> On 29. 09. 20, 14:34, Peilin Ye wrote:
> > the work in general? I couldn't think of how do we clean up subsystems
> > one by one, while keeping a `console_font` in `struct vc_data`.
> 
> Hi,
> 
> feel free to change struct vc_data's content as you need, of course.
> Only the UAPI _definitions_ have to be preserved (like struct console_font).

Ah, I see. Thank you for the reminder!

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
