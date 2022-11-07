Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A82D61FB53
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23F810E776;
	Mon,  7 Nov 2022 17:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FD310E776
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 17:27:48 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id w4so7310901qts.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 09:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OtwMIMageNgEFgITDbP/X4AlmExFVOD7QsjK39jRkOs=;
 b=ZrBbGd0NE5W3bFjfpMfVEGchJiOqL5vKGUnJZWHQEDCz71oryF6CDiPscJkkJaNeeg
 /pKDfIl6hW5yw8tjgrcZSOwrloCrFqYb1/s9Bc1/cV94xFkaKkZwH1bCSgyaTCtOH5Nq
 2ijwSehO6aXkrD87GuWevIaaXGPhzXmGc/u0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OtwMIMageNgEFgITDbP/X4AlmExFVOD7QsjK39jRkOs=;
 b=RF1tfsbyTsJYW/NyYsQLhesEjZVp4Pt3vchSE+Bvzp1CJHi74B1qtEgv3331c7VUJP
 iD/ofVcv3Gr8FqW4oOUbUNcyj5nXc1DYhSZFQ9o1LadYjkEQQdneNwZSEnWM+lWILoJi
 GdOG6McZT6ZWuCubWxPH0tJytIub7c5W2MyliUe5g/EqEBGMXSPuxi9TFzGS9r27OGPq
 k6lvAgkVEHPfyiWVADeZgFICnfApsFGYm7xGlNhElPENBAmlMuEGySLzhoyGzRfePIXh
 JER08YbIATRXR7itTLXlPu3aZX1JQmno3UClBwnTRuMf26cmg1KLZCiAHt5PCpe9PIU9
 G73w==
X-Gm-Message-State: ANoB5pmvb3x6JOlt8ZOLYohLqwzdG7RkRbWOojR5/kLADpdDYbL/T/Le
 Cgygpmzsu2nCeEWuu9bnBiiPyJUJdziRTw==
X-Google-Smtp-Source: AA0mqf7D9uOYOh1cZWoSMdB4KjsHyM5NEpjDnhDaXctvBKDe3X4UhaiYlTdoTf7CDuDpF4sbrjKxAw==
X-Received: by 2002:ac8:7dc6:0:b0:3a5:83d1:a1b6 with SMTP id
 c6-20020ac87dc6000000b003a583d1a1b6mr6494189qte.155.1667842067282; 
 Mon, 07 Nov 2022 09:27:47 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a454c00b006e16dcf99c8sm7357971qkp.71.2022.11.07.09.27.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 09:27:42 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id z192so14503961yba.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 09:27:40 -0800 (PST)
X-Received: by 2002:a05:6902:1352:b0:6bb:3f4b:9666 with SMTP id
 g18-20020a056902135200b006bb3f4b9666mr46634218ybu.101.1667842059236; Mon, 07
 Nov 2022 09:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20221107161740.144456-1-david@redhat.com>
In-Reply-To: <20221107161740.144456-1-david@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 7 Nov 2022 09:27:23 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj51-dtxf8BQBYP+9Kc3ejq4Y0=-6hCbf_XAnkT3fsgDQ@mail.gmail.com>
Message-ID: <CAHk-=wj51-dtxf8BQBYP+9Kc3ejq4Y0=-6hCbf_XAnkT3fsgDQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/19] mm/gup: remove FOLL_FORCE usage from drivers
 (reliable R/O long-term pinning)
To: David Hildenbrand <david@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 linux-rdma@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 etnaviv@lists.freedesktop.org, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>, Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 8:18 AM David Hildenbrand <david@redhat.com> wrote:
>
> So instead, make R/O long-term pinning work as expected, by breaking COW
> in a COW mapping early, such that we can remove any FOLL_FORCE usage from
> drivers.

Nothing makes me unhappy from a quick scan through these patches.

And I'd really love to just have this long saga ended, and FOLL_FORCE
finally relegated to purely ptrace accesses.

So an enthusiastic Ack from me.

                   Linus
