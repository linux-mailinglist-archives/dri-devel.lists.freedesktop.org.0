Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BC31E5B67
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 11:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A243A6E129;
	Thu, 28 May 2020 09:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E688D6E129
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 09:05:22 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id l27so9126540ejc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 02:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/vaqLjNbs4piNK8cHlXi2gJftHYymCTgiDe8fspLXcw=;
 b=ajULVm2LOJ5IrLTPJom23LXVV3TDYGGkAoPHO+3APj6DqhuZK9TrBWMYvGjgPN7LB8
 Ll3v+r1yfkdWmgOx/u+y1xBCAN424w8SSNm4mdLWByGVO0FjiQo0Dt4WYrDi8QKqN8gp
 rWh1ZQXp11t7C6XONfIZHVWtb6/ItoJgA/VhIKY1/hfZhX3rv0O81RCgv1kOvq8FSyVo
 GHPRO79T6n+fTr9aW9C0xmXajPGxyueyLFQuWSeghaOR9IhDW+DgaPL1E7V3AO6u1+p/
 C2z7iqimMbExTifJ0sHnJpHGPjk94JgxWZqbfDQ2e6RVfzPCtPyinBIElQ2NG3I2bCH7
 RcLA==
X-Gm-Message-State: AOAM532ZB+LNRmY2U/OeFN9HgvuAjePr90f9A4il3paBqepafJH1ksao
 DxmsArSDiUEly3c8gcvOLLc=
X-Google-Smtp-Source: ABdhPJwq6tD4O0trcWGRjfLio769XDUhV7qoG+YbP4wCCZ+7K+Gtl8VzA/n45+sr+G24aaA2R77mwA==
X-Received: by 2002:a17:906:7b52:: with SMTP id
 n18mr2124539ejo.292.1590656721457; 
 Thu, 28 May 2020 02:05:21 -0700 (PDT)
Received: from localhost (ip-37-188-185-40.eurotel.cz. [37.188.185.40])
 by smtp.gmail.com with ESMTPSA id r2sm1332714ejs.94.2020.05.28.02.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 02:05:19 -0700 (PDT)
Date: Thu, 28 May 2020 11:05:17 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: next-20200515: Xorg killed due to "OOM"
Message-ID: <20200528090517.GA27484@dhcp22.suse.cz>
References: <20200526091054.GA12103@amd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526091054.GA12103@amd>
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
Cc: Andrew Morton <akpm@osdl.org>, airlied@linux.ie, x86@kernel.org,
 kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 26-05-20 11:10:54, Pavel Machek wrote:
[...]
> [38617.276517] oom_reaper: reaped process 31769 (chromium), now anon-rss:0kB, file-rss:0kB, shmem-rss:7968kB
> [38617.277232] Xorg invoked oom-killer: gfp_mask=0x0(), order=0, oom_score_adj=0
> [38617.277247] CPU: 0 PID: 2978 Comm: Xorg Not tainted 5.7.0-rc5-next-20200515+ #117
> [38617.277256] Hardware name: LENOVO 17097HU/17097HU, BIOS 7BETD8WW (2.19 ) 03/31/2011
> [38617.277266] Call Trace:
> [38617.277286]  dump_stack+0x54/0x6e
> [38617.277300]  dump_header+0x45/0x321
> [38617.277313]  oom_kill_process.cold+0x9/0xe
> [38617.277324]  ? out_of_memory+0x167/0x420
> [38617.277336]  out_of_memory+0x1f2/0x420
> [38617.277348]  pagefault_out_of_memory+0x34/0x56
> [38617.277361]  mm_fault_error+0x4a/0x130
> [38617.277372]  do_page_fault+0x3ce/0x416

The reason the OOM killer has been invoked is that the page fault
handler has returned VM_FAULT_OOM. So this is not a result of the page
allocator struggling to allocate a memory. It would be interesting to
check which code path has returned this. 
-- 
Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
