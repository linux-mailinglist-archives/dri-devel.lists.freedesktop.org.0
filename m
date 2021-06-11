Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FA33A48DB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 20:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F776F3C0;
	Fri, 11 Jun 2021 18:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6A36E079;
 Fri, 11 Jun 2021 18:50:13 +0000 (UTC)
IronPort-SDR: CV1yb3mTDG4l7c/BMyZjjqUhPYxB4OLAEvW79XuX8eQAcbpsVNQ2SlRpl2+BfDzkpLUZmd253b
 Dt6yW123JOaQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="203754081"
X-IronPort-AV: E=Sophos;i="5.83,267,1616482800"; d="scan'208";a="203754081"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 11:50:11 -0700
IronPort-SDR: sYEix0KXwIxrqzUdcHgIjFPcsG+oCixyU8+0iJcKaHLHNun67sbzD5GztNcfN5eKs/YGkyw04o
 oWv/tB8rKODQ==
X-IronPort-AV: E=Sophos;i="5.83,267,1616482800"; d="scan'208";a="636208084"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 11:50:11 -0700
Date: Fri, 11 Jun 2021 11:43:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 07/13] drm/i915/guc: New definition of the CTB
 registration action
Message-ID: <20210611184318.GA28306@sdutt-i7>
References: <20210607180356.165785-1-matthew.brost@intel.com>
 <20210607180356.165785-8-matthew.brost@intel.com>
 <946237c6-1671-b419-5337-d5b8cc02a041@intel.com>
 <04a5897a-b521-b999-433e-81c417a19f70@intel.com>
 <4ec30495-2694-46da-225f-456ed2b6b4ee@intel.com>
 <20210610043858.GA12287@sdutt-i7>
 <d9b10d18-1b1f-3d50-a2e7-571a412d571a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9b10d18-1b1f-3d50-a2e7-571a412d571a@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 03:19:50PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10.06.2021 06:38, Matthew Brost wrote:
> > On Wed, Jun 09, 2021 at 10:07:21PM +0200, Michal Wajdeczko wrote:
> >>
> >>
> >> On 09.06.2021 19:36, John Harrison wrote:
> >>> On 6/7/2021 18:23, Daniele Ceraolo Spurio wrote:
> >>>> On 6/7/2021 11:03 AM, Matthew Brost wrote:
> >>>>> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>>>
> >>>>> Definition of the CTB registration action has changed.
> >>>>> Add some ABI documentation and implement required changes.
> >>>>>
> >>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>>>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com> #4
> >>>>> ---
> >>>>>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 107 ++++++++++++++++++
> >>>>>   .../gt/uc/abi/guc_communication_ctb_abi.h     |   4 -
> >>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  76 ++++++++-----
> >>>>>   3 files changed, 152 insertions(+), 35 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> >>>>> b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> >>>>> index 90efef8a73e4..6426fc183692 100644
> >>>>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> >>>>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> >>>>> @@ -6,6 +6,113 @@
> >>>>>   #ifndef _ABI_GUC_ACTIONS_ABI_H
> >>>>>   #define _ABI_GUC_ACTIONS_ABI_H
> >>>>>   +/**
> >>>>> + * DOC: HOST2GUC_REGISTER_CTB
> >>>>> + *
> >>>>> + * This message is used as part of the `CTB based communication`_
> >>>>> setup.
> >>>>> + *
> >>>>> + * This message must be sent as `MMIO HXG Message`_.
> >>>>> + *
> >>>>> + *
> >>>>> +---+-------+--------------------------------------------------------------+
> >>>>>
> >>>>> + *  |   | Bits  |
> >>>>> Description                                                  |
> >>>>> + *
> >>>>> +===+=======+==============================================================+
> >>>>>
> >>>>> + *  | 0 |    31 | ORIGIN =
> >>>>> GUC_HXG_ORIGIN_HOST_                                |
> >>>>> + *  |
> >>>>> +-------+--------------------------------------------------------------+
> >>>>> + *  |   | 30:28 | TYPE =
> >>>>> GUC_HXG_TYPE_REQUEST_                                 |
> >>>>> + *  |
> >>>>> +-------+--------------------------------------------------------------+
> >>>>> + *  |   | 27:16 | DATA0 =
> >>>>> MBZ                                                  |
> >>>>> + *  |
> >>>>> +-------+--------------------------------------------------------------+
> >>>>> + *  |   |  15:0 | ACTION = _`GUC_ACTION_HOST2GUC_REGISTER_CTB` =
> >>>>> 0x5200        |
> >>>>
> >>>> Specs says 4505
> >>>>
> >>>>> + *
> >>>>> +---+-------+--------------------------------------------------------------+
> >>>>>
> >>>>> + *  | 1 | 31:12 | RESERVED =
> >>>>> MBZ                                               |
> >>>>> + *  |
> >>>>> +-------+--------------------------------------------------------------+
> >>>>> + *  |   |  11:8 | **TYPE** - type for the `CT
> >>>>> Buffer`_                         |
> >>>>> + *  |   |
> >>>>> |                                                              |
> >>>>> + *  |   |       |   - _`GUC_CTB_TYPE_HOST2GUC` =
> >>>>> 0                             |
> >>>>> + *  |   |       |   - _`GUC_CTB_TYPE_GUC2HOST` =
> >>>>> 1                             |
> >>>>> + *  |
> >>>>> +-------+--------------------------------------------------------------+
> >>>>> + *  |   |   7:0 | **SIZE** - size of the `CT Buffer`_ in 4K units
> >>>>> minus 1      |
> >>>>> + *
> >>>>> +---+-------+--------------------------------------------------------------+
> >>>>>
> >>>>> + *  | 2 |  31:0 | **DESC_ADDR** - GGTT address of the `CTB
> >>>>> Descriptor`_        |
> >>>>> + *
> >>>>> +---+-------+--------------------------------------------------------------+
> >>>>>
> >>>>> + *  | 3 |  31:0 | **BUFF_ADDF** - GGTT address of the `CT
> >>>>> Buffer`_             |
> >>>>> + *
> >>>>> +---+-------+--------------------------------------------------------------+
> >>>>>
> >>>>> +*
> >>>>> + *
> >>>>> +---+-------+--------------------------------------------------------------+
> >>>>>
> >>>>> + *  |   | Bits  |
> >>>>> Description                                                  |
> >>>>> + *
> >>>>> +===+=======+==============================================================+
> >>>>>
> >>>>> + *  | 0 |    31 | ORIGIN =
> >>>>> GUC_HXG_ORIGIN_GUC_                                 |
> >>>>> + *  |
> >>>>> +-------+--------------------------------------------------------------+
> >>>>> + *  |   | 30:28 | TYPE =
> >>>>> GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> >>>>> + *  |
> >>>>> +-------+--------------------------------------------------------------+
> >>>>> + *  |   |  27:0 | DATA0 =
> >>>>> MBZ                                                  |
> >>>>> + *
> >>>>> +---+-------+--------------------------------------------------------------+
> >>>>>
> >>>>> + */
> >>>>> +#define GUC_ACTION_HOST2GUC_REGISTER_CTB        0x4505 // FIXME 0x5200
> >>>>
> >>>> Why FIXME? AFAICS the specs still says 4505, even if we plan to update
> >>>> at some point I don;t think this deserves a FIXME since nothing is
> >>>> incorrect.
> >>>>
> >>>>> +
> >>>>> +#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_LEN
> >>>>> (GUC_HXG_REQUEST_MSG_MIN_LEN + 3u)
> >>>>> +#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_0_MBZ
> >>>>> GUC_HXG_REQUEST_MSG_0_DATA0
> >>>>> +#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_MBZ        (0xfffff << 12)
> >>>>> +#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_TYPE    (0xf << 8)
> >>>>> +#define   GUC_CTB_TYPE_HOST2GUC                0u
> >>>>> +#define   GUC_CTB_TYPE_GUC2HOST                1u
> >>>>> +#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_SIZE    (0xff << 0)
> >>>>> +#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_2_DESC_ADDR
> >>>>> GUC_HXG_REQUEST_MSG_n_DATAn
> >>>>> +#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_3_BUFF_ADDR
> >>>>> GUC_HXG_REQUEST_MSG_n_DATAn
> >>>>
> >>>> The full mask still seems like overkill to me and I still think we
> >>>> should use BIT()/GENMASK() and a _MASK prefix, but not going to block
> >>>> on it.
> >>>>
> >>>>> +
> >>>>> +#define HOST2GUC_REGISTER_CTB_RESPONSE_MSG_LEN
> >>>>> GUC_HXG_RESPONSE_MSG_MIN_LEN
> >>>>> +#define HOST2GUC_REGISTER_CTB_RESPONSE_MSG_0_MBZ
> >>>>> GUC_HXG_RESPONSE_MSG_0_DATA0
> >>>>> +
> >>>>> +/**
> >>>>> + * DOC: HOST2GUC_DEREGISTER_CTB
> >>>>> + *
> >>>>> + * This message is used as part of the `CTB based communication`_
> >>>>> teardown.
> >>>>> + *
> >>>>> + * This message must be sent as `MMIO HXG Message`_.
> >>>>> + *
> >>>>> + *
> >>>>> +---+-------+--------------------------------------------------------------+
> >>>>>
> >>>>> + *  |   | Bits  |
> >>>>> Description                                                  |
> >>>>> + *
> >>>>> +===+=======+==============================================================+
> >>>>>
> >>>>> + *  | 0 |    31 | ORIGIN =
> >>>>> GUC_HXG_ORIGIN_HOST_                                |
> >>>>> + *  |
> >>>>> +-------+--------------------------------------------------------------+
> >>>>> + *  |   | 30:28 | TYPE =
> >>>>> GUC_HXG_TYPE_REQUEST_                                 |
> >>>>> + *  |
> >>>>> +-------+--------------------------------------------------------------+
> >>>>> + *  |   | 27:16 | DATA0 =
> >>>>> MBZ                                                  |
> >>>>> + *  |
> >>>>> +-------+--------------------------------------------------------------+
> >>>>> + *  |   |  15:0 | ACTION = _`GUC_ACTION_HOST2GUC_DEREGISTER_CTB` =
> >>>>> 0x5201      |
> >>>>
> >>>> Specs says 4506
> >>>>
> >>> I would say that the enum value should not be included in the structure
> >>> definition. I would also argue that there is no point in repeating the
> >>> common header structure for every single H2G action definition. That is
> >>> just overly verbose and makes it harder to read the spec. It implies
> >>> that every action has a different header structure and must be coded
> >>> individually.
> >>
> >> but some actions are defined as REQUEST some as EVENT, so we need to say
> >> that, also each REQUEST action may define its own DATA0, so again we
> >> still need to define these bits somewhere
> >>
> >>>
> >>> Personally, I don't believe we should be replicating the entire GuC API
> >>> spec in the driver header files anyway. This is not something that is
> >>> defined by the i915 driver so the i915 driver should not be defining it!
> >>> Instead, just include a link or pointer to where the actual spec can be
> >>> found. We don't copy the entire bspec page for every register that the
> >>> driver touches, so why should this be any different?
> > 
> > I agree with John on this one. We plan publishing the GuC, right? Let's
> 
> Do you know of any ETA? I don't
> 

No, I don't.

> and likely the same promise was given few years back when GuC was
> introduced in upstream, I don't want to have just code that we can't
> compare with specification (in any form)
> 
> 
> > just point to it in the kernel DOC.
> > 
> > Also at some all these defines really should be auto-generated. I
> > suppose if these headers are auto-generated, I could live with these
> 
> I was also hoping to get these ABI headers auto-generated before we
> start to used them for good, unfortunately it was quite the opposite:
> for some time these hand crafted tables were used as input for
> discussion and then to prepare machine readable formats, but the only
> tool currently available (and still WIP) is for generating spec
> documentation
>

A tool really shouldn't be too hard to write to auto-generate headers.
Every other project I've worked on did tons of auto-generation of code
and I've personally written about 5 of these tools. This would be great
project for an intern or a newer employee.
 
> > files generating kernel DOC. I can't really live with having to maintain
> > a table like this for every action manually.
> 
> the goal is to freeze ABI so no maintenance will be necessary, except
> adding new actions, and that's also the reason to keep these ABI files
> separate from the rest of our headers, where we can add/modify/improve
> any helpers/wrappers as we want.
> 
> and I don't recall that you were forced to modify any of such tables
> yet, nor were asked to manually prepare them for the rest of the
> existing actions, especially GuC submission ones, so why complain?
>

I'm fine with this going in, I just personally don't want to have to
manually create a table like this for every GuC submission action.

Matt
 
> > 
> > Matt
> > 
> >>
> >> to some extend we have to replicate at least part of the GuC ABI spec,
> >> part that defines all bits, and IMHO there is nothing wrong if it comes
> >> with full message layout definitions, especially if you compare that
> >> with previous approach, were H2G action definitions were limited just to
> >> single enum value (and to find out how to use given H2G you had to look
> >> into firmware source code)
> >>
> >> so while we keep these abi.h files in kernel repo, they shall be treated
> >> as read-only imported external interface definitions, from which we just
> >> use all #define for coding and DOC: for documentation (latter at least
> >> until GuC will release its spec to the public)
> >>
> >>>
> >>> John.
> >>>
> >>>
> >>>>> + *
> >>>>> +---+-------+--------------------------------------------------------------+
> >>>>>
> >>>>> + *  | 1 | 31:12 | RESERVED =
> >>>>> MBZ                                               |
> >>>>> + *  |
> >>>>> +-------+--------------------------------------------------------------+
> >>>>> + *  |   |  11:8 | **TYPE** - type of the `CT
> >>>>> Buffer`_                          |
> >>>>> + *  |   |
> >>>>> |                                                              |
> >>>>> + *  |   |       | see
> >>>>> `GUC_ACTION_HOST2GUC_REGISTER_CTB`_                      |
> >>>>> + *  |
> >>>>> +-------+--------------------------------------------------------------+
> >>>>> + *  |   |   7:0 | RESERVED =
> >>>>> MBZ                                               |
> >>>>> + *
> >>>>> +---+-------+--------------------------------------------------------------+
> >>>>>
> >>>>> +*
> >>>>> + *
> >>>>> +---+-------+--------------------------------------------------------------+
> >>>>>
> >>>>> + *  |   | Bits  |
> >>>>> Description                                                  |
> >>>>> + *
> >>>>> +===+=======+==============================================================+
> >>>>>
> >>>>> + *  | 0 |    31 | ORIGIN =
> >>>>> GUC_HXG_ORIGIN_GUC_                                 |
> >>>>> + *  |
> >>>>> +-------+--------------------------------------------------------------+
> >>>>> + *  |   | 30:28 | TYPE =
> >>>>> GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> >>>>> + *  |
> >>>>> +-------+--------------------------------------------------------------+
> >>>>> + *  |   |  27:0 | DATA0 =
> >>>>> MBZ                                                  |
> >>>>> + *
> >>>>> +---+-------+--------------------------------------------------------------+
> >>>>>
> >>>>> + */
> >>>>> +#define GUC_ACTION_HOST2GUC_DEREGISTER_CTB        0x4506 // FIXME
> >>>>> 0x5201
> >>>>
> >>>> Same comment for the FIXME as above
> >>>>
> >>>>> +
> >>>>> +#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_LEN
> >>>>> (GUC_HXG_REQUEST_MSG_MIN_LEN + 1u)
> >>>>> +#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_0_MBZ
> >>>>> GUC_HXG_REQUEST_MSG_0_DATA0
> >>>>> +#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_MBZ    (0xfffff << 12)
> >>>>> +#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_TYPE    (0xf << 8)
> >>>>> +#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_MBZ2    (0xff << 0)
> >>>>> +
> >>>>> +#define HOST2GUC_DEREGISTER_CTB_RESPONSE_MSG_LEN
> >>>>> GUC_HXG_RESPONSE_MSG_MIN_LEN
> >>>>> +#define HOST2GUC_DEREGISTER_CTB_RESPONSE_MSG_0_MBZ
> >>>>> GUC_HXG_RESPONSE_MSG_0_DATA0
> >>>>> +
> >>>>> +/* legacy definitions */
> >>>>> +
> >>>>>   enum intel_guc_action {
> >>>>>       INTEL_GUC_ACTION_DEFAULT = 0x0,
> >>>>>       INTEL_GUC_ACTION_REQUEST_PREEMPTION = 0x2,
> >>>>> diff --git
> >>>>> a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> >>>>> b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> >>>>> index c2a069a78e01..127b256a662c 100644
> >>>>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> >>>>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> >>>>> @@ -112,10 +112,6 @@ static_assert(sizeof(struct guc_ct_buffer_desc)
> >>>>> == 64);
> >>>>>    * - **flags**, holds various bits to control message handling
> >>>>>    */
> >>>>>   -/* Type of command transport buffer */
> >>>>> -#define INTEL_GUC_CT_BUFFER_TYPE_SEND    0x0u
> >>>>> -#define INTEL_GUC_CT_BUFFER_TYPE_RECV    0x1u
> >>>>> -
> >>>>>   /*
> >>>>>    * Definition of the command transport message header (DW0)
> >>>>>    *
> >>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> >>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> >>>>> index 3241a477196f..6a29be779cc9 100644
> >>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> >>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> >>>>> @@ -103,9 +103,9 @@ void intel_guc_ct_init_early(struct intel_guc_ct
> >>>>> *ct)
> >>>>>   static inline const char *guc_ct_buffer_type_to_str(u32 type)
> >>>>>   {
> >>>>>       switch (type) {
> >>>>> -    case INTEL_GUC_CT_BUFFER_TYPE_SEND:
> >>>>> +    case GUC_CTB_TYPE_HOST2GUC:
> >>>>>           return "SEND";
> >>>>> -    case INTEL_GUC_CT_BUFFER_TYPE_RECV:
> >>>>> +    case GUC_CTB_TYPE_GUC2HOST:
> >>>>>           return "RECV";
> >>>>>       default:
> >>>>>           return "<invalid>";
> >>>>> @@ -136,25 +136,33 @@ static void guc_ct_buffer_init(struct
> >>>>> intel_guc_ct_buffer *ctb,
> >>>>>       guc_ct_buffer_reset(ctb);
> >>>>>   }
> >>>>>   -static int guc_action_register_ct_buffer(struct intel_guc *guc,
> >>>>> -                     u32 desc_addr,
> >>>>> -                     u32 type)
> >>>>> +static int guc_action_register_ct_buffer(struct intel_guc *guc, u32
> >>>>> type,
> >>>>> +                     u32 desc_addr, u32 buff_addr, u32 size)
> >>>>>   {
> >>>>> -    u32 action[] = {
> >>>>> -        INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER,
> >>>>> -        desc_addr,
> >>>>> -        sizeof(struct guc_ct_buffer_desc),
> >>>>> -        type
> >>>>> +    u32 request[HOST2GUC_REGISTER_CTB_REQUEST_MSG_LEN] = {
> >>>>> +        FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> >>>>> +        FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> >>>>> +        FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> >>>>> GUC_ACTION_HOST2GUC_REGISTER_CTB),
> >>>>
> >>>> IMO we could use a macro or 2 for the HXG header, to avoid all these
> >>>> lines, which are hard to read. something like:
> >>>>
> >>>> GUC_HXG_HEADER(origin, type, data, action) \
> >>>>     (FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, origin) | \
> >>>>      FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) | \
> >>>> FIELD_PREP(GUC_HXG_MSG_0_DATA0, data) | \
> >>>>      FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, action))
> >>>>
> >>>> H2G_HEADER(type, data, action) \
> >>>>     GUC_HXG_HEADER(GUC_HXG_ORIGIN_HOST, type, data, action)
> >>>>
> >>>> and then call
> >>>>
> >>>> H2G_HEADER(GUC_HXG_TYPE_REQUEST, 0, GUC_ACTION_HOST2GUC_REGISTER_CTB)
> >>>>
> >>>>
> >>>> Not a blocker.
> >>>>
> >>>> Daniele
> >>>>
> >>>>> + FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_SIZE, size / SZ_4K -
> >>>>> 1) |
> >>>>> +        FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_TYPE, type),
> >>>>> + FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_2_DESC_ADDR, desc_addr),
> >>>>> + FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_3_BUFF_ADDR, buff_addr),
> >>>>>       };
> >>>>>   -    /* Can't use generic send(), CT registration must go over MMIO */
> >>>>> -    return intel_guc_send_mmio(guc, action, ARRAY_SIZE(action),
> >>>>> NULL, 0);
> >>>>> +    GEM_BUG_ON(type != GUC_CTB_TYPE_HOST2GUC && type !=
> >>>>> GUC_CTB_TYPE_GUC2HOST);
> >>>>> +    GEM_BUG_ON(size % SZ_4K);
> >>>>> +
> >>>>> +    /* CT registration must go over MMIO */
> >>>>> +    return intel_guc_send_mmio(guc, request, ARRAY_SIZE(request),
> >>>>> NULL, 0);
> >>>>>   }
> >>>>>   -static int ct_register_buffer(struct intel_guc_ct *ct, u32
> >>>>> desc_addr, u32 type)
> >>>>> +static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
> >>>>> +                  u32 desc_addr, u32 buff_addr, u32 size)
> >>>>>   {
> >>>>> -    int err = guc_action_register_ct_buffer(ct_to_guc(ct),
> >>>>> desc_addr, type);
> >>>>> +    int err;
> >>>>>   +    err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
> >>>>> +                        desc_addr, buff_addr, size);
> >>>>>       if (unlikely(err))
> >>>>>           CT_ERROR(ct, "Failed to register %s buffer (err=%d)\n",
> >>>>>                guc_ct_buffer_type_to_str(type), err);
> >>>>> @@ -163,14 +171,17 @@ static int ct_register_buffer(struct
> >>>>> intel_guc_ct *ct, u32 desc_addr, u32 type)
> >>>>>     static int guc_action_deregister_ct_buffer(struct intel_guc *guc,
> >>>>> u32 type)
> >>>>>   {
> >>>>> -    u32 action[] = {
> >>>>> -        INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER,
> >>>>> -        CTB_OWNER_HOST,
> >>>>> -        type
> >>>>> +    u32 request[HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_LEN] = {
> >>>>> +        FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> >>>>> +        FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> >>>>> +        FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> >>>>> GUC_ACTION_HOST2GUC_DEREGISTER_CTB),
> >>>>> +        FIELD_PREP(HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_TYPE, type),
> >>>>>       };
> >>>>>   -    /* Can't use generic send(), CT deregistration must go over
> >>>>> MMIO */
> >>>>> -    return intel_guc_send_mmio(guc, action, ARRAY_SIZE(action),
> >>>>> NULL, 0);
> >>>>> +    GEM_BUG_ON(type != GUC_CTB_TYPE_HOST2GUC && type !=
> >>>>> GUC_CTB_TYPE_GUC2HOST);
> >>>>> +
> >>>>> +    /* CT deregistration must go over MMIO */
> >>>>> +    return intel_guc_send_mmio(guc, request, ARRAY_SIZE(request),
> >>>>> NULL, 0);
> >>>>>   }
> >>>>>     static int ct_deregister_buffer(struct intel_guc_ct *ct, u32 type)
> >>>>> @@ -258,7 +269,7 @@ void intel_guc_ct_fini(struct intel_guc_ct *ct)
> >>>>>   int intel_guc_ct_enable(struct intel_guc_ct *ct)
> >>>>>   {
> >>>>>       struct intel_guc *guc = ct_to_guc(ct);
> >>>>> -    u32 base, cmds;
> >>>>> +    u32 base, desc, cmds;
> >>>>>       void *blob;
> >>>>>       int err;
> >>>>>   @@ -274,23 +285,26 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
> >>>>>       GEM_BUG_ON(blob != ct->ctbs.send.desc);
> >>>>>         /* (re)initialize descriptors */
> >>>>> -    cmds = base + ptrdiff(ct->ctbs.send.cmds, blob);
> >>>>>       guc_ct_buffer_reset(&ct->ctbs.send);
> >>>>> -
> >>>>> -    cmds = base + ptrdiff(ct->ctbs.recv.cmds, blob);
> >>>>>       guc_ct_buffer_reset(&ct->ctbs.recv);
> >>>>>         /*
> >>>>>        * Register both CT buffers starting with RECV buffer.
> >>>>>        * Descriptors are in first half of the blob.
> >>>>>        */
> >>>>> -    err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs.recv.desc,
> >>>>> blob),
> >>>>> -                 INTEL_GUC_CT_BUFFER_TYPE_RECV);
> >>>>> +    desc = base + ptrdiff(ct->ctbs.recv.desc, blob);
> >>>>> +    cmds = base + ptrdiff(ct->ctbs.recv.cmds, blob);
> >>>>> +    err = ct_register_buffer(ct, GUC_CTB_TYPE_GUC2HOST,
> >>>>> +                 desc, cmds, ct->ctbs.recv.size * 4);
> >>>>> +
> >>>>>       if (unlikely(err))
> >>>>>           goto err_out;
> >>>>>   -    err = ct_register_buffer(ct, base +
> >>>>> ptrdiff(ct->ctbs.send.desc, blob),
> >>>>> -                 INTEL_GUC_CT_BUFFER_TYPE_SEND);
> >>>>> +    desc = base + ptrdiff(ct->ctbs.send.desc, blob);
> >>>>> +    cmds = base + ptrdiff(ct->ctbs.send.cmds, blob);
> >>>>> +    err = ct_register_buffer(ct, GUC_CTB_TYPE_HOST2GUC,
> >>>>> +                 desc, cmds, ct->ctbs.send.size * 4);
> >>>>> +
> >>>>>       if (unlikely(err))
> >>>>>           goto err_deregister;
> >>>>>   @@ -299,7 +313,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
> >>>>>       return 0;
> >>>>>     err_deregister:
> >>>>> -    ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_RECV);
> >>>>> +    ct_deregister_buffer(ct, GUC_CTB_TYPE_GUC2HOST);
> >>>>>   err_out:
> >>>>>       CT_PROBE_ERROR(ct, "Failed to enable CTB (%pe)\n", ERR_PTR(err));
> >>>>>       return err;
> >>>>> @@ -318,8 +332,8 @@ void intel_guc_ct_disable(struct intel_guc_ct *ct)
> >>>>>       ct->enabled = false;
> >>>>>         if (intel_guc_is_fw_running(guc)) {
> >>>>> -        ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_SEND);
> >>>>> -        ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_RECV);
> >>>>> +        ct_deregister_buffer(ct, GUC_CTB_TYPE_HOST2GUC);
> >>>>> +        ct_deregister_buffer(ct, GUC_CTB_TYPE_GUC2HOST);
> >>>>>       }
> >>>>>   }
> >>>>
> >>>
