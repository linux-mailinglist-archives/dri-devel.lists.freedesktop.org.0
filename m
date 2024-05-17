Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594988C83DA
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 11:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB22110EE5D;
	Fri, 17 May 2024 09:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q7nnnXKo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1286410EE57;
 Fri, 17 May 2024 09:38:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 134B561808;
 Fri, 17 May 2024 09:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E01C4AF0B;
 Fri, 17 May 2024 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715938719;
 bh=vcW+W1wogmO6WY+GSQu3IAR/P96Rw6SpWddj5psVWwk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q7nnnXKoCoZCRE9y8qfd0GjlbgMZcow94ZBAhyo/a3WB7eilpoBw2+BvdmX0v1BZf
 e7OVkid9omI+gvcN303kxsn1XDNSTYdJqgftO+q7xqgbBFEfRALDNx6MNApEOaSItp
 R/U+wW3wKfdgVg1pSTt+l5Ktt5O2287ep0H8zh6uS0rANv32EVrNlYH0N2LN0Wkz4S
 7JyAvYOZKqMfev4RirENIqVjY9S2NBz5t0xMnmDlB0lD8J6a25LhI7NPYbYJS3uooO
 gi0eyy/jJtvOQvPPH73HE5rAvo90fxUfGOyoScW2xWZLVtSxLMRh/mH25kBaP3Lv2i
 C+gw9xG0H/JCg==
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-5b2f4090ac9so287481eaf.2; 
 Fri, 17 May 2024 02:38:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVyL1LumgE9nBsMlqgdQ3MAHKp4jaLCVp91r+BHwVhyoa/pL2gMrgOH8dC24HzBGDAt0P/cRyv/16rjJ+ahmm+bssXDhjm4goa6HWU7Y4EnVegNFQIQqmHhay1EuNHwRbsBuxiAQw5v5kYTrJdmHGIQ20wy53QtxwoKPFrrhHe6swSihCMaN1ecJIvXBKsotoTSpPrjesI4Mjpadl7J698rm7zw1KPw9/moaXTp1/AiUngKrUPdy24WD1rnGP4OR1TgPgYOK18SLDP+OSzA41ow
X-Gm-Message-State: AOJu0YzUPXQxvlX9MhakNrnSNHGXIhgMsE3iZ5WY7auIaqed6g3P+xlo
 xgMHL1p559TICw0hyW1XpLJ2diTLo8EpO/UQadF3YXcn+Yvxc45ft65DHcwEut5mlY/amDZLXZA
 7ahfEmKC/hoIp/6Cz9mnbgvNwLAw=
X-Google-Smtp-Source: AGHT+IGDE99s+s68qJbXMtkzFnMd5s/9OBNB6sR0+sCICB0PpLHU9X3BbBFmCRlDywLZhowLPWB9T1lJ6YvckXBFFDs=
X-Received: by 2002:a05:6820:2602:b0:5b2:8017:fb68 with SMTP id
 006d021491bc7-5b2815cd95fmr22153827eaf.0.1715938718475; Fri, 17 May 2024
 02:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240516133454.681ba6a0@rorschach.local.home>
In-Reply-To: <20240516133454.681ba6a0@rorschach.local.home>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 17 May 2024 11:38:25 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hGNNvUq-BNHynaWr-5YVC6ugki81R70SG4uu34Rk-Mew@mail.gmail.com>
Message-ID: <CAJZ5v0hGNNvUq-BNHynaWr-5YVC6ugki81R70SG4uu34Rk-Mew@mail.gmail.com>
Subject: Re: [PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
 Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, 
 kvm@vger.kernel.org, linux-block@vger.kernel.org, linux-cxl@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-rdma@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
 linux-tegra@vger.kernel.org, netdev@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 ath12k@lists.infradead.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, linux-usb@vger.kernel.org, 
 linux-bcachefs@vger.kernel.org, linux-nfs@vger.kernel.org, 
 ocfs2-devel@lists.linux.dev, linux-cifs@vger.kernel.org, 
 linux-xfs@vger.kernel.org, linux-edac@vger.kernel.org, 
 selinux@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-hwmon@vger.kernel.org, io-uring@vger.kernel.org, 
 linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-wpan@vger.kernel.org, 
 dev@openvswitch.org, linux-s390@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, Julia Lawall <Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, May 16, 2024 at 7:35=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
>
> [
>    This is a treewide change. I will likely re-create this patch again in
>    the second week of the merge window of v6.10 and submit it then. Hopin=
g
>    to keep the conflicts that it will cause to a minimum.
> ]
>
> With the rework of how the __string() handles dynamic strings where it
> saves off the source string in field in the helper structure[1], the
> assignment of that value to the trace event field is stored in the helper
> value and does not need to be passed in again.
>
> This means that with:
>
>   __string(field, mystring)
>
> Which use to be assigned with __assign_str(field, mystring), no longer
> needs the second parameter and it is unused. With this, __assign_str()
> will now only get a single parameter.
>
> There's over 700 users of __assign_str() and because coccinelle does not
> handle the TRACE_EVENT() macro I ended up using the following sed script:
>
>   git grep -l __assign_str | while read a ; do
>       sed -e 's/\(__assign_str([^,]*[^ ,]\) *,[^;]*/\1)/' $a > /tmp/test-=
file;
>       mv /tmp/test-file $a;
>   done
>
> I then searched for __assign_str() that did not end with ';' as those
> were multi line assignments that the sed script above would fail to catch=
.
>
> Note, the same updates will need to be done for:
>
>   __assign_str_len()
>   __assign_rel_str()
>   __assign_rel_str_len()
>
> I tested this with both an allmodconfig and an allyesconfig (build only f=
or both).
>
> [1] https://lore.kernel.org/linux-trace-kernel/20240222211442.634192653@g=
oodmis.org/
>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Julia Lawall <Julia.Lawall@inria.fr>
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Acked-by: Rafael J. Wysocki <rafael@kernel.org> # for thermal
