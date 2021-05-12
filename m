Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A52037B833
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 10:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADFC6EB63;
	Wed, 12 May 2021 08:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9256EB67
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 08:40:06 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id s6so26035052edu.10
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 01:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DN72HFH+LUVzK+cplVzUJsN944LoEuI4v0cnkxdBkwI=;
 b=TX1RsdXLiR+Wp/CmqOcpqfZXIGZd6fJmPxq1IJf8NDDNRAL2Fau7/FciTzE1/Xfds5
 7Ci8Zvm4+6ceNcSNDsO9oSbOB2hB4FlZ5Z2cypJxTvn5Aaz0/GKhXb3BurkvncbSpowo
 XxQkIW8XQmIdhVMxkBl2pVKlukn21YQwEIOzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DN72HFH+LUVzK+cplVzUJsN944LoEuI4v0cnkxdBkwI=;
 b=me8MjB9U+9zt2fvD3H0oHoiLnYDQbnwbCtaf3Nx07ZaL2qKJwCvhMLfVDuhpzwGH32
 uuS2vzr4LqF0kVHfCc3W3BMhCBovjqbjzyJu3deong08v7A2f36oaf244jyuS+O2Ka9c
 OQMKfQQyUUaZL6d+th2lGkE9s2qG6Cx92Xke/V3l7fTMWOyeKsQv0vs/AtvHwUMsD7UH
 0mI+0c65uwldNL89IGGuCMVysc6dgSvlNUxNNxsyqCMf2yMs8MPoXfmF2unaKj0yqxAT
 lywpMEavSsO1jyx++Mkn7ZUu8EqE+ThhZAGfVkixzytYGM54SK8Okb+519oAvAYv3n1K
 B2Bw==
X-Gm-Message-State: AOAM5326ayTMDL/BgSRemsiHcNY3z9VqPHt6bc5+Eo8ChXdE3wK2ruSC
 wLZDmWSlD3O8XxqfLwhIyFhlfw==
X-Google-Smtp-Source: ABdhPJyUGOs8MGHBdr2vYMAXtdXpyVNm+FNxDu4or1i/Sw/1qfcW0q/D1Cw6884ziYFflO5eErrR4w==
X-Received: by 2002:a05:6402:310a:: with SMTP id
 dc10mr41787585edb.38.1620808804790; 
 Wed, 12 May 2021 01:40:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d25sm16749061edx.58.2021.05.12.01.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 01:40:04 -0700 (PDT)
Date: Wed, 12 May 2021 10:40:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [RFC PATCH 20/97] drm/i915/guc: Introduce unified HXG messages
Message-ID: <YJuUYngcDhB8mTlp@phenom.ffwll.local>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-21-matthew.brost@intel.com>
 <YJqf1uKIyeHvSf+f@phenom.ffwll.local>
 <bffc13d2-a24e-2615-2730-bad2fd6b3651@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bffc13d2-a24e-2615-2730-bad2fd6b3651@intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Matthew Brost <matthew.brost@intel.com>, tvrtko.ursulin@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jason.ekstrand@intel.com, daniele.ceraolospurio@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 12, 2021 at 12:11:40AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 11.05.2021 17:16, Daniel Vetter wrote:
> > On Thu, May 06, 2021 at 12:13:34PM -0700, Matthew Brost wrote:
> >> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>
> >> New GuC firmware will unify format of MMIO and CTB H2G messages.
> >> Introduce their definitions now to allow gradual transition of
> >> our code to match new changes.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >> Cc: Michał Winiarski <michal.winiarski@intel.com>
> >> ---
> >>  .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 226 ++++++++++++++++++
> >>  1 file changed, 226 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> >> index 775e21f3058c..1c264819aa03 100644
> >> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> >> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> >> @@ -6,6 +6,232 @@
> >>  #ifndef _ABI_GUC_MESSAGES_ABI_H
> >>  #define _ABI_GUC_MESSAGES_ABI_H
> >>  
> >> +/**
> >> + * DOC: HXG Message
> > 
> > These aren't useful if we don't pull them in somewhere in the
> > Documentation/gpu hierarchy. General comment, and also please check that
> > it all renders correctly still.
> 
> Patch that connects all these DOC sections into i915.rst is still on
> private branch, where I'm trying to verify all html rendering, and ...
> 
> > 
> > btw if you respin a patch not originally by you we generally add a (v1) to
> > the original s-o-b line (or whever the version split was) and explain in
> > the usual changelog in the commit message what was changed.
> > 
> > This holds for the entire series ofc.
> > -Daniel
> > 
> >> + *
> >> + * All messages exchanged with GuC are defined using 32 bit dwords.
> >> + * First dword is treated as a message header. Remaining dwords are optional.
> >> + *
> >> + * .. _HXG Message:
> 
> where such workarounds from early documentation are already removed,
> since they are not needed any more starting from commit ef09989594bf
> ("scripts/kernel-doc: add internal hyperlink to DOC: sections")

Oh this is nice. Fwiw the upstream commit is:

commit 06a755d6269c072ed0c9b84227eaf33113dc243f
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Jan 18 12:08:13 2021 +0100

    scripts/kernel-doc: add internal hyperlink to DOC: sections

I guess the sha1 you have is from your own branch?
-Daniel


> 
> Michal
> 
> >> + *
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  |   | Bits  | Description                                                  |
> >> + *  +===+=======+==============================================================+
> >> + *  |   |       |                                                              |
> >> + *  | 0 |    31 | **ORIGIN** - originator of the message                       |
> >> + *  |   |       |   - _`GUC_HXG_ORIGIN_HOST` = 0                               |
> >> + *  |   |       |   - _`GUC_HXG_ORIGIN_GUC` = 1                                |
> >> + *  |   |       |                                                              |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   | 30:28 | **TYPE** - message type                                      |
> >> + *  |   |       |   - _`GUC_HXG_TYPE_REQUEST` = 0                              |
> >> + *  |   |       |   - _`GUC_HXG_TYPE_EVENT` = 1                                |
> >> + *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_BUSY` = 3                     |
> >> + *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_RETRY` = 5                    |
> >> + *  |   |       |   - _`GUC_HXG_TYPE_RESPONSE_FAILURE` = 6                     |
> >> + *  |   |       |   - _`GUC_HXG_TYPE_RESPONSE_SUCCESS` = 7                     |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   |  27:0 | **AUX** - auxiliary data (depends TYPE)                      |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  | 1 |  31:0 | optional payload (depends on TYPE)                           |
> >> + *  +---+-------+                                                              |
> >> + *  |...|       |                                                              |
> >> + *  +---+-------+                                                              |
> >> + *  | n |  31:0 |                                                              |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + */
> >> +
> >> +#define GUC_HXG_MSG_MIN_LEN			1u
> >> +#define GUC_HXG_MSG_0_ORIGIN			(0x1 << 31)
> >> +#define   GUC_HXG_ORIGIN_HOST			0u
> >> +#define   GUC_HXG_ORIGIN_GUC			1u
> >> +#define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
> >> +#define   GUC_HXG_TYPE_REQUEST			0u
> >> +#define   GUC_HXG_TYPE_EVENT			1u
> >> +#define   GUC_HXG_TYPE_NO_RESPONSE_BUSY		3u
> >> +#define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
> >> +#define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
> >> +#define   GUC_HXG_TYPE_RESPONSE_SUCCESS		7u
> >> +#define GUC_HXG_MSG_0_AUX			(0xfffffff << 0)
> >> +
> >> +/**
> >> + * DOC: HXG Request
> >> + *
> >> + * The `HXG Request`_ message should be used to initiate synchronous activity
> >> + * for which confirmation or return data is expected.
> >> + *
> >> + * The recipient of this message shall use `HXG Response`_, `HXG Failure`_
> >> + * or `HXG Retry`_ message as a definite reply, and may use `HXG Busy`_
> >> + * message as a intermediate reply.
> >> + *
> >> + * Format of @DATA0 and all @DATAn fields depends on the @ACTION code.
> >> + *
> >> + * _HXG Request:
> >> + *
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  |   | Bits  | Description                                                  |
> >> + *  +===+=======+==============================================================+
> >> + *  | 0 |    31 | ORIGIN                                                       |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   | 27:16 | **DATA0** - request data (depends on ACTION)                 |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   |  15:0 | **ACTION** - requested action code                           |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  | 1 |  31:0 | **DATA1** - optional data (depends on ACTION)                |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  |...|       |                                                              |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  | n |  31:0 | **DATAn** - optional data (depends on ACTION)                |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + */
> >> +
> >> +#define GUC_HXG_REQUEST_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
> >> +#define GUC_HXG_REQUEST_MSG_0_DATA0		(0xfff << 16)
> >> +#define GUC_HXG_REQUEST_MSG_0_ACTION		(0xffff << 0)
> >> +#define GUC_HXG_REQUEST_MSG_n_DATAn		(0xffffffff << 0)
> >> +
> >> +/**
> >> + * DOC: HXG Event
> >> + *
> >> + * The `HXG Event`_ message should be used to initiate asynchronous activity
> >> + * that does not involves immediate confirmation nor data.
> >> + *
> >> + * Format of @DATA0 and all @DATAn fields depends on the @ACTION code.
> >> + *
> >> + * .. _HXG Event:
> >> + *
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  |   | Bits  | Description                                                  |
> >> + *  +===+=======+==============================================================+
> >> + *  | 0 |    31 | ORIGIN                                                       |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_EVENT_                                   |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   | 27:16 | **DATA0** - event data (depends on ACTION)                   |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   |  15:0 | **ACTION** - event action code                               |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  | 1 |  31:0 | **DATA1** - optional event data (depends on ACTION)          |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  |...|       |                                                              |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  | n |  31:0 | **DATAn** - optional event  data (depends on ACTION)         |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + */
> >> +
> >> +#define GUC_HXG_EVENT_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
> >> +#define GUC_HXG_EVENT_MSG_0_DATA0		(0xfff << 16)
> >> +#define GUC_HXG_EVENT_MSG_0_ACTION		(0xffff << 0)
> >> +#define GUC_HXG_EVENT_MSG_n_DATAn		(0xffffffff << 0)
> >> +
> >> +/**
> >> + * DOC: HXG Busy
> >> + *
> >> + * The `HXG Busy`_ message may be used to acknowledge reception of the `HXG Request`_
> >> + * message if the recipient expects that it processing will be longer than default
> >> + * timeout.
> >> + *
> >> + * The @COUNTER field may be used as a progress indicator.
> >> + *
> >> + * .. _HXG Busy:
> >> + *
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  |   | Bits  | Description                                                  |
> >> + *  +===+=======+==============================================================+
> >> + *  | 0 |    31 | ORIGIN                                                       |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_NO_RESPONSE_BUSY_                        |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   |  27:0 | **COUNTER** - progress indicator                             |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + */
> >> +
> >> +#define GUC_HXG_BUSY_MSG_LEN			GUC_HXG_MSG_MIN_LEN
> >> +#define GUC_HXG_BUSY_MSG_0_COUNTER		GUC_HXG_MSG_0_AUX
> >> +
> >> +/**
> >> + * DOC: HXG Retry
> >> + *
> >> + * The `HXG Retry`_ message should be used by recipient to indicate that the
> >> + * `HXG Request`_ message was dropped and it should be resent again.
> >> + *
> >> + * The @REASON field may be used to provide additional information.
> >> + *
> >> + * .. _HXG Retry:
> >> + *
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  |   | Bits  | Description                                                  |
> >> + *  +===+=======+==============================================================+
> >> + *  | 0 |    31 | ORIGIN                                                       |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_NO_RESPONSE_RETRY_                       |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   |  27:0 | **REASON** - reason for retry                                |
> >> + *  |   |       |  - _`GUC_HXG_RETRY_REASON_UNSPECIFIED` = 0                   |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + */
> >> +
> >> +#define GUC_HXG_RETRY_MSG_LEN			GUC_HXG_MSG_MIN_LEN
> >> +#define GUC_HXG_RETRY_MSG_0_REASON		GUC_HXG_MSG_0_AUX
> >> +#define   GUC_HXG_RETRY_REASON_UNSPECIFIED	0u
> >> +
> >> +/**
> >> + * DOC: HXG Failure
> >> + *
> >> + * The `HXG Failure`_ message shall be used as a reply to the `HXG Request`_
> >> + * message that could not be processed due to an error.
> >> + *
> >> + * .. _HXG Failure:
> >> + *
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  |   | Bits  | Description                                                  |
> >> + *  +===+=======+==============================================================+
> >> + *  | 0 |    31 | ORIGIN                                                       |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_FAILURE_                        |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   | 27:16 | **HINT** - additional error hint                             |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   |  15:0 | **ERROR** - error/result code                                |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + */
> >> +
> >> +#define GUC_HXG_FAILURE_MSG_LEN			GUC_HXG_MSG_MIN_LEN
> >> +#define GUC_HXG_FAILURE_MSG_0_HINT		(0xfff << 16)
> >> +#define GUC_HXG_FAILURE_MSG_0_ERROR		(0xffff << 0)
> >> +
> >> +/**
> >> + * DOC: HXG Response
> >> + *
> >> + * The `HXG Response`_ message SHALL be used as a reply to the `HXG Request`_
> >> + * message that was successfully processed without an error.
> >> + *
> >> + * .. _HXG Response:
> >> + *
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  |   | Bits  | Description                                                  |
> >> + *  +===+=======+==============================================================+
> >> + *  | 0 |    31 | ORIGIN                                                       |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> >> + *  |   +-------+--------------------------------------------------------------+
> >> + *  |   |  27:0 | **DATA0** - data (depends on ACTION from `HXG Request`_)     |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  | 1 |  31:0 | **DATA1** - data (depends on ACTION from `HXG Request`_)     |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  |...|       |                                                              |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + *  | n |  31:0 | **DATAn** - data (depends on ACTION from `HXG Request`_)     |
> >> + *  +---+-------+--------------------------------------------------------------+
> >> + */
> >> +
> >> +#define GUC_HXG_RESPONSE_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
> >> +#define GUC_HXG_RESPONSE_MSG_0_DATA0		GUC_HXG_MSG_0_AUX
> >> +#define GUC_HXG_RESPONSE_MSG_n_DATAn		(0xffffffff << 0)
> >> +
> >> +/* deprecated */
> >>  #define INTEL_GUC_MSG_TYPE_SHIFT	28
> >>  #define INTEL_GUC_MSG_TYPE_MASK		(0xF << INTEL_GUC_MSG_TYPE_SHIFT)
> >>  #define INTEL_GUC_MSG_DATA_SHIFT	16
> >> -- 
> >> 2.28.0
> >>
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
