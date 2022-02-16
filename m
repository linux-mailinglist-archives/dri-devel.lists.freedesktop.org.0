Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3202C4B8FDF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 19:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4031C10E1F2;
	Wed, 16 Feb 2022 18:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF8A10E1F2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 18:09:46 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id p15so1108984ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 10:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dsoF6XbVRJnqOxLapkisfvdDBSbyOEKGfv87xWkqHBo=;
 b=H8EZzc3vbZYf96mKzjlBDBIZSlEvwXS9/cmk8gIRTNI1MAwfaOAbt22JaPzIFJh6SU
 haljNM84uLArCZw16a7/Bsg1jw9a9dpDJPFefdN6wlu3bpRuDM6rCoTBfs58oYcxVKD3
 nbRVV3036QZdC6Y3iMcylW2hsU3GnC78jLfj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dsoF6XbVRJnqOxLapkisfvdDBSbyOEKGfv87xWkqHBo=;
 b=SmK7q9ft2BD5AF8mCwtTWYV0HuyRA/I6wS/JcDfiFTvx7ZNmFggdWVITTo3Cen+SX4
 DRIdF3D/gUy3cmYqgZLCRmOKPCkGZeOhroTxnmM12qFyEBXW90/Z/P46QR4BcHgoazvf
 Rn32DhyUTqZO9GjnqeeEOAMf+4AbJwON3bnI9JC13EZX29aI17JDZfjAJohHg8jDKmI6
 7a5UN7IROx2vSU5zmEfh7272qZoU9Yg56a0x3WYiYYW69m65CXX9+PSz2GW66rZniZqF
 g4GoWcMKfjqvGB99aReyTGXlBivuJcXv/JibxBkzQ/ROn/MZ494IKOiz9xOW6U+fOcv9
 BK4g==
X-Gm-Message-State: AOAM53084uY3raGPZoeDVSojcMpUhGdNIrCFaD/A0cTES3DY+QqiAUdR
 BY8jnKgM/Tqfitay69rQGWLkTCcVtcypu+9rF+Y=
X-Google-Smtp-Source: ABdhPJy6MJ/yN0mHaEWw0L1KocS4THi7BN0TfoLsNDdzHCYJRCos5+T2/ysRPCp4TyeVZhM81Amtlg==
X-Received: by 2002:a17:906:370f:b0:6ce:6e7:7344 with SMTP id
 d15-20020a170906370f00b006ce06e77344mr3127864ejc.654.1645034984829; 
 Wed, 16 Feb 2022 10:09:44 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com.
 [209.85.218.50])
 by smtp.gmail.com with ESMTPSA id i24sm182597ejg.40.2022.02.16.10.09.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 10:09:44 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id qk11so1161692ejb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 10:09:43 -0800 (PST)
X-Received: by 2002:ac2:5313:0:b0:443:99c1:7e89 with SMTP id
 c19-20020ac25313000000b0044399c17e89mr289887lfh.531.1645034970931; Wed, 16
 Feb 2022 10:09:30 -0800 (PST)
MIME-Version: 1.0
References: <1644984747-26706-1-git-send-email-byungchul.park@lge.com>
 <1644984964-28300-1-git-send-email-byungchul.park@lge.com>
 <1644984964-28300-3-git-send-email-byungchul.park@lge.com>
 <94b1cba2-0e78-bbc0-0321-8be70b2b3be2@opensource.wdc.com>
In-Reply-To: <94b1cba2-0e78-bbc0-0321-8be70b2b3be2@opensource.wdc.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 16 Feb 2022 10:09:14 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgfpfWuNQi2SjXQL1ir6iKCpUdBruJ+kmOQP1frH7Zdig@mail.gmail.com>
Message-ID: <CAHk-=wgfpfWuNQi2SjXQL1ir6iKCpUdBruJ+kmOQP1frH7Zdig@mail.gmail.com>
Subject: Re: Report in ata_scsi_port_error_handler()
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
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
Cc: hamohammed.sa@gmail.com, Jan Kara <jack@suse.cz>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Amir Goldstein <amir73il@gmail.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "J. Bruce Fields" <bfields@fieldses.org>, kernel-team@lge.com,
 Joel Fernandes <joel@joelfernandes.org>, Christoph Lameter <cl@linux.com>,
 Will Deacon <will@kernel.org>, duyuyang@gmail.com,
 Sasha Levin <sashal@kernel.org>, paolo.valente@linaro.org,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Dave Airlie <airlied@linux.ie>, Ingo Molnar <mingo@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Vladimir Davydov <vdavydov.dev@gmail.com>,
 David Rientjes <rientjes@google.com>, Dennis Zhou <dennis@kernel.org>,
 Linux-MM <linux-mm@kvack.org>, ngupta@vflare.org, melissa.srw@gmail.com,
 johannes.berg@intel.com, Dan Williams <dan.j.williams@intel.com>,
 Josef Bacik <josef@toxicpanda.com>, Steven Rostedt <rostedt@goodmis.org>,
 Byungchul Park <byungchul.park@lge.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Jerome Glisse <jglisse@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Michal Hocko <mhocko@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Jens Axboe <axboe@kernel.dk>,
 linux-block <linux-block@vger.kernel.org>, sj@kernel.org,
 Theodore Ts'o <tytso@mit.edu>, rodrigosiqueiramelo@gmail.com,
 linux-ide@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, Minchan Kim <minchan@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 10:37 PM Damien Le Moal
<damien.lemoal@opensource.wdc.com> wrote:
>
> On 2/16/22 13:16, Byungchul Park wrote:
> > [    2.051040] ===================================================
> > [    2.051406] DEPT: Circular dependency has been detected.
> > [    2.051730] 5.17.0-rc1-00014-gcf3441bb2012 #2 Tainted: G        W
> > [    2.051991] ---------------------------------------------------
> > [    2.051991] summary
> > [    2.051991] ---------------------------------------------------
> > [    2.051991] *** DEADLOCK ***
> > [    2.051991]
> > [    2.051991] context A
> > [    2.051991]     [S] (unknown)(&(&ap->eh_wait_q)->dmap:0)
> > [    2.051991]     [W] __raw_spin_lock_irq(&host->lock:0)
> > [    2.051991]     [E] event(&(&ap->eh_wait_q)->dmap:0)
> > [    2.051991]
> > [    2.051991] context B
> > [    2.051991]     [S] __raw_spin_lock_irqsave(&host->lock:0)
> > [    2.051991]     [W] wait(&(&ap->eh_wait_q)->dmap:0)
> > [    2.051991]     [E] spin_unlock(&host->lock:0)
>
> Sleeping with a spinlock held would be triggering warnings already, so
> these reports seem bogus to me.

Yeah, Matthew pointed out the same thing for another use-case, where
it looks like DEPT is looking at the state at the wrong point (not at
the scheduling point, but at prepare_to_sleep()).

This ata_port_wait() is the exact same pattern, ie we have

        spin_lock_irqsave(ap->lock, flags);

        while (ap->pflags & (ATA_PFLAG_EH_PENDING | ATA_PFLAG_EH_IN_PROGRESS)) {
                prepare_to_wait(&ap->eh_wait_q, &wait, TASK_UNINTERRUPTIBLE);
                spin_unlock_irqrestore(ap->lock, flags);
                schedule();

and DEPT has incorrectly taken it to mean that 'ap->lock' is held
during the wait, when it is actually released before actually waiting.

For the spin-locks, this is all very obvious (because they'd have been
caught long ago by much simpler debug code), but the same
prepare_to_wait -> wait pattern can most definitely happen with
sleeping locks too, so they are all slightly suspect.

And yes, the detailed reports are hard to read because the locations
are given as "ata_port_wait_eh+0x52/0xc0". Running them through
scripts/decode_stacktrace.sh to turn them into filename and line
numbers - and also sort out inlining - would help a lot.

Byungchul, could you fix those two issues? Some of your reports may
well be entirely valid, but the hard-to-read hex offsets and the
knowledge that at least some of them are confused about how
prepare_to_wait -> wait actually works makes the motivation to look at
the details much less..

           Linus
