Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B4494B522
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 04:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAEF10E02F;
	Thu,  8 Aug 2024 02:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VR3zg8VG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510BA10E041
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 02:49:56 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6b79c969329so3017886d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 19:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723085395; x=1723690195; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wCK7OrHV/RXkSDhtoAmVTQPNoEQ+lSxs9BlEtpZYM8=;
 b=VR3zg8VGCAcOGygsOQFNdt/zrdSvUTHbT7vQ0YzCi+tuDliyoZY/w1jVBnHv7MnQX/
 BPnPPSrbMeqkPUYWDtMxuVAARgyk9Vex/1HXy80GxMyoFiaDYv6BMgCFmN+XrQTZdx+/
 x2pcA3Jgc+JDLAOakJKLh8V1uqYRgvZ/V8tvpec96uwMhUZ47tG2TqUPX8QEPdShKoyo
 PqBqHEJhwxOIGOpEi6MFvKdUhlNDv37rNSJXZpAHEcf1lIMhbyknKoyHaalO2iHO/tsm
 RkvZEiAvzhqDIvvetC8mMUPDSx2jVJ8qBuGrUfCZMt1LXT3nPeSjCcXlGbItPla75QEa
 WmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723085395; x=1723690195;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4wCK7OrHV/RXkSDhtoAmVTQPNoEQ+lSxs9BlEtpZYM8=;
 b=mhYrZox0/nFN+SU7Cc1hdSyrgn9H2IMl+o7Dsr7x2uX7EK6iHXi5p8P9c32oQxbzT+
 5ea1hG7u9tyCV/2ER03T83cKEtIlyAptqRFqNlIRWvqFr1uGR6Ubtl06K+yURUqUHc/M
 lhJ+Ou7EIWfqKB1U11I0iTQqJyRYlUFfm4BP/c5eSjYMeyhejmbWNxbr4rRNJChlA65X
 RO5ruUGAxK80k/xP/Od0VTBsCJjDPTg+oOiOsgoYL89fycM4pQwqnGUpTQCMB5Ho7D51
 NT0PCEV7G+CmuqpxClHjEOt1tDM2hMeMDif05FKEgjZ14dJW1P3VrLZhlvux1VwVxf8z
 +Orw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbqahXQ+ReGvIYs09v/4CvfwMg2zTjuiMWrXg6tUgqSeauMM8ntDhU4+x7VRNLXa1G3N5K4BKljgpXjFy33CIf3aa5S+4A6XcoomAzPAx2
X-Gm-Message-State: AOJu0YxSZsYxCf4FJk1+p+8iHf75zRf8qHQYNG/nv1dFk/l0O6PN7ycs
 8LaH+ebKjwE3Z8Y/E42f8Kg67HxGV9GVhW9CKlrixpkXiWHTz3vtGxvmnHu/vWLIRwhwJJNxzsg
 5Er0SEzei2/3Swspqi8SFT2omClo=
X-Google-Smtp-Source: AGHT+IFAUbAmwMhJNJgsN0YPryyoi42HRLLz74PRZZtqqDpLNMLF+qLuRDBW3t/1Fjr4gj2UTXsNjeSbG/Ntg/8Q0mk=
X-Received: by 2002:a05:6214:4b0f:b0:6b5:4aa9:9687 with SMTP id
 6a1803df08f44-6bd6bd971c9mr6794786d6.50.1723085395024; Wed, 07 Aug 2024
 19:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <2jxak5v6dfxlpbxhpm3ey7oup4g2lnr3ueurfbosf5wdo65dk4@srb3hsk72zwq>
In-Reply-To: <2jxak5v6dfxlpbxhpm3ey7oup4g2lnr3ueurfbosf5wdo65dk4@srb3hsk72zwq>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 8 Aug 2024 10:49:17 +0800
Message-ID: <CALOAHbBKzrvibUbj-1W7Z79AZsvOpMeG--EZ0pf2k0iyuPa1_w@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Improve the copy of task comm
To: Alejandro Colomar <alx@kernel.org>
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, 
 alexei.starovoitov@gmail.com, audit@vger.kernel.org, bpf@vger.kernel.org, 
 catalin.marinas@arm.com, dri-devel@lists.freedesktop.org, 
 ebiederm@xmission.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
 linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp, 
 rostedt@goodmis.org, selinux@vger.kernel.org, serge@hallyn.com
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

On Wed, Aug 7, 2024 at 1:28=E2=80=AFAM Alejandro Colomar <alx@kernel.org> w=
rote:
>
> Hi Linus,
>
> Serge let me know about this thread earlier today.
>
> On 2024-08-05, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > On Mon, 5 Aug 2024 at 20:01, Yafang Shao <laoar.shao@gmail.com> wrote:
> > >
> > > One concern about removing the BUILD_BUG_ON() is that if we extend
> > > TASK_COMM_LEN to a larger size, such as 24, the caller with a
> > > hardcoded 16-byte buffer may overflow.
> >
> > No, not at all. Because get_task_comm() - and the replacements - would
> > never use TASK_COMM_LEN.
> >
> > They'd use the size of the *destination*. That's what the code already =
does:
> >
> >   #define get_task_comm(buf, tsk) ({                      \
> >   ...
> >         __get_task_comm(buf, sizeof(buf), tsk);         \
> >
> > note how it uses "sizeof(buf)".
>
> In shadow.git, we also implemented macros that are named after functions
> and calculate the appropriate number of elements internally.
>
>         $ grepc -h STRNCAT .
>         #define STRNCAT(dst, src)  strncat(dst, src, NITEMS(src))
>         $ grepc -h STRNCPY .
>         #define STRNCPY(dst, src)  strncpy(dst, src, NITEMS(dst))
>         $ grepc -h STRTCPY .
>         #define STRTCPY(dst, src)  strtcpy(dst, src, NITEMS(dst))
>         $ grepc -h STRFTIME .
>         #define STRFTIME(dst, fmt, tm)  strftime(dst, NITEMS(dst), fmt, t=
m)
>         $ grepc -h DAY_TO_STR .
>         #define DAY_TO_STR(str, day, iso)   day_to_str(NITEMS(str), str, =
day, iso)
>
> They're quite useful, and when implementing them we found and fixed
> several bugs thanks to them.
>
> > Now, it might be a good idea to also verify that 'buf' is an actual
> > array, and that this code doesn't do some silly "sizeof(ptr)" thing.
>
> I decided to use NITEMS() instead of sizeof() for that reason.
> (NITEMS() is just our name for ARRAY_SIZE().)
>
>         $ grepc -h NITEMS .
>         #define NITEMS(a)            (SIZEOF_ARRAY((a)) / sizeof((a)[0]))
>
> > We do have a helper for that, so we could do something like
> >
> >    #define get_task_comm(buf, tsk) \
> >         strscpy_pad(buf, __must_be_array(buf)+sizeof(buf), (tsk)->comm)
>
> We have SIZEOF_ARRAY() for when you want the size of an array:
>
>         $ grepc -h SIZEOF_ARRAY .
>         #define SIZEOF_ARRAY(a)      (sizeof(a) + must_be_array(a))

There is already a similar macro in Linux:

  /**
   * ARRAY_SIZE - get the number of elements in array @arr
   * @arr: array to be sized
   */
  #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) +
__must_be_array(arr))

will use it instead of the sizeof().

>
> However, I don't think you want sizeof().  Let me explain why:
>
> -  Let's say you want to call wcsncpy(3) (I know nobody should be using
>    that function, not strncpy(3), but I'm using it as a standard example
>    of a wide-character string function).
>
>    You should call wcsncpy(dst, src, NITEMS(dst)).
>    A call wcsncpy(dst, src, sizeof(dst)) is bogus, since the argument is
>    the number of wide characters, not the number of bytes.
>
>    When translating that to normal characters, you want conceptually the
>    same operation, but on (normal) characters.  That is, you want
>    strncpy(dst, src, NITEMS(dst)).  While strncpy(3) with sizeof() works
>    just fine because sizeof(char)=3D=3D1 by definition, it is conceptuall=
y
>    wrong to use it.
>
>    By using NITEMS() (i.e., ARRAY_SIZE()), you get the __must_be_array()
>    check for free.
>
> In the end, SIZEOF_ARRAY() is something we very rarely use.  It's there
> only used in the following two cases at the moment:
>
>         #define NITEMS(a)            (SIZEOF_ARRAY((a)) / sizeof((a)[0]))
>         #define MEMZERO(arr)  memzero(arr, SIZEOF_ARRAY(arr))
>
> Does that sound convincing?
>
> For memcpy(3) for example, you do want sizeof(), because you're copying
> raw bytes, but with strings, in which characters are conceptually
> meaningful elements, NITEMS() makes more sense.
>
> BTW, I'm working on a __lengthof__ operator that will soon allow using
> it on function parameters declared with array notation.  That is,
>
>         size_t
>         f(size_t n, int a[n])
>         {
>                 return __lengthof__(a);  // This will return n.
>         }
>
> If you're interested in it, I'm developing and discussing it here:
> <https://inbox.sourceware.org/gcc-patches/20240806122218.3827577-1-alx@ke=
rnel.org/>
>
> >
> > as a helper macro for this all.
> >
> > (Although I'm not convinced we generally want the "_pad()" version,
> > but whatever).
>
> We had problems with it in shadow recently.  In user-space, it's similar
> to strncpy(3) (at least if you wrap it in a macro that makes sure that
> it terminates the string with a null byte).
>
> We had a lot of uses of strncpy(3), from old times where that was used
> to copy strings with truncation.  I audited all of that code (and
> haven't really finished yet), and translated to calls similar to
> strscpy(9) (we call it strtcpy(), as it _t_runcates).  The problem was
> that in some cases the padding was necessary, and in others it was not,
> and it was very hard to distinguish those.
>
> I recommend not zeroing strings unnecessarily, since that will make it
> hard to review the code later.  E.g., twenty years from now, someone
> takes a piece of code with a _pad() call, and has no clue if the zeroing
> was for a reason, or for no reason.
>
> On the other hand, not zeroing may make it easier to explot bugs, so
> whatever you think best.  In the kernel you may need to be more worried
> than in user space.  Whatever.  :)

Good point.
I will avoid using the _pad().

--
Regards
Yafang
