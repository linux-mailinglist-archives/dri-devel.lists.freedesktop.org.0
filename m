Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0499A746B39
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612C010E2AE;
	Tue,  4 Jul 2023 07:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DB710E2AA;
 Tue,  4 Jul 2023 07:55:04 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4QwFSd6sBGz9sSN;
 Tue,  4 Jul 2023 09:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1688457297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0liI8Pu/8xa8Dl9jFpuxkH+YuWCmEEgP3GWm7h7OAwI=;
 b=EZQdCPvZeFjSFnJ5SdpvtbUDc9N2TrFnvCeTnK1wQJV3g1ZhmznGtL7ElaLVkMLtgzxZGM
 n+EzK/MCUuCh+gKyQ0+zEyyZkz3OAeTEkHJa7SA7Z1JeVwPk8C2SA5ZAKL7E5dG75hUQ/g
 n8yjkbDiwJZ5aJuqcdJCH3/MnAMNeD2uU644w0En+YmPOAQvttO/A30+ZuHzzD5uWe/ryj
 tWacaPUgCIT4uk3Qv0Fbcsl0eLmRgs8qvU6jaTkMD+eu1D45T3gk4fSom/saBvPsT76JX+
 sCm+V/KakYxzh6I79AHCDl5qhpIeT6Hk6vXRyPSTHFtk8Dx2ZQJi7EbHwSZmng==
Message-ID: <cb0b6b51-3a94-481b-26a1-89ff398d7835@mailbox.org>
Date: Tue, 4 Jul 2023 09:54:55 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <CA+hFU4z1pc=KUVVqyqfXEceUqMXQgh-qUnuB=1nkPELghvQO7w@mail.gmail.com>
 <CADnq5_MNVdtdcWKSz6dgmsjg+kEu8p5FVE+fkw_5BaXeG3QGow@mail.gmail.com>
 <afab1f5a-e581-3416-e2c2-238ea120655b@mailbox.org>
 <CAAxE2A5C96k5ua+r938VA_+w7gHHNTdF3n8LwDb98W0Bf9wCVA@mail.gmail.com>
 <7c1e6df5-1ad4-be3c-b95d-92dc62a8c537@mailbox.org>
 <CAAxE2A7RGDY4eRC85CsqfszNzyKvMU2MX1wa+3HZ1hgNeAw3cQ@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAAxE2A7RGDY4eRC85CsqfszNzyKvMU2MX1wa+3HZ1hgNeAw3cQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6f75c7af4b51ba2a261
X-MBO-RS-META: 79ms488kzhmr48ukwrpa61pk87dn8fd7
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/4/23 04:34, Marek Olšák wrote:
> On Mon, Jul 3, 2023, 03:12 Michel Dänzer <michel.daenzer@mailbox.org <mailto:michel.daenzer@mailbox.org>> wrote:
>     On 6/30/23 22:32, Marek Olšák wrote:
>     > On Fri, Jun 30, 2023 at 11:11 AM Michel Dänzer <michel.daenzer@mailbox.org <mailto:michel.daenzer@mailbox.org> <mailto:michel.daenzer@mailbox.org <mailto:michel.daenzer@mailbox.org>>> wrote:
>     >> On 6/30/23 16:59, Alex Deucher wrote:
>     >>> On Fri, Jun 30, 2023 at 10:49 AM Sebastian Wick
>     >>> <sebastian.wick@redhat.com <mailto:sebastian.wick@redhat.com> <mailto:sebastian.wick@redhat.com <mailto:sebastian.wick@redhat.com>>> wrote:
>     >>>> On Tue, Jun 27, 2023 at 3:23 PM André Almeida <andrealmeid@igalia.com <mailto:andrealmeid@igalia.com> <mailto:andrealmeid@igalia.com <mailto:andrealmeid@igalia.com>>> wrote:
>     >>>>>
>     >>>>> +Robustness
>     >>>>> +----------
>     >>>>> +
>     >>>>> +The only way to try to keep an application working after a reset is if it
>     >>>>> +complies with the robustness aspects of the graphical API that it is using.
>     >>>>> +
>     >>>>> +Graphical APIs provide ways to applications to deal with device resets. However,
>     >>>>> +there is no guarantee that the app will use such features correctly, and the
>     >>>>> +UMD can implement policies to close the app if it is a repeating offender,
>     >>>>> +likely in a broken loop. This is done to ensure that it does not keep blocking
>     >>>>> +the user interface from being correctly displayed. This should be done even if
>     >>>>> +the app is correct but happens to trigger some bug in the hardware/driver.
>     >>>>
>     >>>> I still don't think it's good to let the kernel arbitrarily kill
>     >>>> processes that it thinks are not well-behaved based on some heuristics
>     >>>> and policy.
>     >>>>
>     >>>> Can't this be outsourced to user space? Expose the information about
>     >>>> processes causing a device and let e.g. systemd deal with coming up
>     >>>> with a policy and with killing stuff.
>     >>>
>     >>> I don't think it's the kernel doing the killing, it would be the UMD.
>     >>> E.g., if the app is guilty and doesn't support robustness the UMD can
>     >>> just call exit().
>     >>
>     >> It would be safer to just ignore API calls[0], similarly to what is done until the application destroys the context with robustness. Calling exit() likely results in losing any unsaved work, whereas at least some applications might otherwise allow saving the work by other means.
>     >
>     > That's a terrible idea. Ignoring API calls would be identical to a freeze. You might as well disable GPU recovery because the result would be the same.
> 
>     No GPU recovery would affect everything using the GPU, whereas this affects only non-robust applications.
> 
> which is currently the majority.

Not sure where you're going with this. Applications need to use robustness to be able to recover from a GPU hang, and the GPU needs to be reset for that. So disabling GPU reset is not the same as what we're discussing here.


>     > - non-robust contexts: call exit(1) immediately, which is the best way to recover
> 
>     That's not the UMD's call to make.
> 
> That's absolutely the UMD's call to make because that's mandated by the hw and API design

Can you point us to a spec which mandates that the process must be killed in this case?


> and only driver devs know this, which this thread is a proof of. The default behavior is to skip all command submission if a non-robust context is lost, which looks like a freeze. That's required to prevent infinite hangs from the same context and can be caused by the side effects of the GPU reset itself, not by the cause of the previous hang. The only way out of that is killing the process.

The UMD killing the process is not the only way out of that, and doing so is overreach on its part. The UMD is but one out of many components in a process, not the main one or a special one. It doesn't get to decide when the process must die, certainly not under circumstances where it must be able to continue while ignoring API calls (that's required for robustness).


>     >>     [0] Possibly accompanied by a one-time message to stderr along the lines of "GPU reset detected but robustness not enabled in context, ignoring OpenGL API calls".


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

