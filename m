Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168CF4DA10A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 18:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AA510E353;
	Tue, 15 Mar 2022 17:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCD210E31D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 17:22:28 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id h21so5874315ila.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 10:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IfCGwES+v0avTn+oCg2Yz2QucYadknfRNmyeG2nFjlk=;
 b=BNHvGBckWnBcTjhX4i+RdWghZdNwAuBsr8A+By6cbvARlyTmfk557KAeOJ72c1t2zF
 Dbksa95ewTZmGZjIT+BcOc35VVczf1bw2iiHnDo8dS5J8ivXIOJfoa6hvspt93J0ZtKI
 gY3Gqo618TJGnsW9M1/PLX2M+mtGvlGFZIAy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IfCGwES+v0avTn+oCg2Yz2QucYadknfRNmyeG2nFjlk=;
 b=AMl3LAt85AJhsaoXSdLJLO+rWxuUBFFMOklSvyICdC1MQ3wwQ+dz+gCjh+YZUnYmbf
 zp7xmAJ+GbqJmLZl8H6V16iF/AKuApQNLXekRCtI/J6KHYmf5KP0Pk5JlKwoPta6TQgA
 t4t1ehS8hcXcs+u3OzJatvKFJv4DcWhbWbiIl69dLFrhRd/3SI+NMMUtgkxbSwVFAat/
 po7JNmLYDDEh75mlfAnPuWSXaus0p+AcCx2FmrXHfKi+18uNrOl2dLG6M3BQwqzApNnL
 VqIE6IfyI8mHjJmlw0qT2FVcr+HwJucvtftxQk+AZTor2HSIgCT95VTbPyooX4rCvx5t
 HnXA==
X-Gm-Message-State: AOAM530Tp+6FrxkHkzCTQuGOpwM5GweD5TgRh+Y/MPHUQf0tDcc0febk
 a447rcpqZXyF+QukXv0Zx0wNOqbG5DK9Dg==
X-Google-Smtp-Source: ABdhPJySCDyIIdRCEliptInYyxcNhl1TxOFRX+aEtGEH6jvivVGwtndA7gN8d7gsRkOsIEGSO0av0w==
X-Received: by 2002:a05:6e02:1449:b0:2c7:aba1:61e8 with SMTP id
 p9-20020a056e02144900b002c7aba161e8mr4378205ilo.110.1647364947368; 
 Tue, 15 Mar 2022 10:22:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:183:200:2e9d:ccac:1819:1d91])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a056e021e0200b002c770ac013fsm8663283ila.24.2022.03.15.10.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 10:22:26 -0700 (PDT)
Date: Tue, 15 Mar 2022 11:22:25 -0600
From: Drew Davenport <ddavenport@chromium.org>
To: "Lee, Shawn C" <shawn.c.lee@intel.com>
Subject: Re: [v7 1/5] drm/edid: seek for available CEA and DisplayID block
 from specific EDID block index
Message-ID: <YjDLUTI9eamjvb2N@chromium.org>
References: <20220313134702.24175-1-shawn.c.lee@intel.com>
 <20220313134702.24175-2-shawn.c.lee@intel.com>
 <87mthtvsds.fsf@intel.com> <Yi+tYBJgkZoaNTSl@chromium.org>
 <87wngvtmz6.fsf@intel.com>
 <BYAPR11MB2710A1F31351816341D04707A3109@BYAPR11MB2710.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR11MB2710A1F31351816341D04707A3109@BYAPR11MB2710.namprd11.prod.outlook.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 15, 2022 at 03:21:05PM +0000, Lee, Shawn C wrote:
> On Tuesday, March 15, 2022 8:33 PM, Nikula, Jani <jani.nikula@intel.com> wrote:
> >On Mon, 14 Mar 2022, Drew Davenport <ddavenport@chromium.org> wrote:
> >> On Mon, Mar 14, 2022 at 10:40:47AM +0200, Jani Nikula wrote:
> >>> On Sun, 13 Mar 2022, Lee Shawn C <shawn.c.lee@intel.com> wrote:
> >>> > drm_find_cea_extension() always look for a top level CEA block. 
> >>> > Pass ext_index from caller then this function to search next 
> >>> > available CEA ext block from a specific EDID block pointer.
> >>> >
> >>> > v2: save proper extension block index if CTA data information
> >>> >     was found in DispalyID block.
> >>> > v3: using different parameters to store CEA and DisplayID block index.
> >>> >     configure DisplayID extansion block index before search available
> >>> >     DisplayID block.
> >>> >
> >>> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >>> > Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> >>> > Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >>> > Cc: Drew Davenport <ddavenport@chromium.org>
> >>> > Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
> >>> > Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> >>> > ---
> >>> >  drivers/gpu/drm/drm_displayid.c | 10 +++++--
> >>> >  drivers/gpu/drm/drm_edid.c      | 53 ++++++++++++++++++---------------
> >>> >  include/drm/drm_displayid.h     |  4 +--
> >>> >  3 files changed, 39 insertions(+), 28 deletions(-)
> >>> >
> >>> > diff --git a/drivers/gpu/drm/drm_displayid.c 
> >>> > b/drivers/gpu/drm/drm_displayid.c index 32da557b960f..31c3e6d7d549 
> >>> > 100644
> >>> > --- a/drivers/gpu/drm/drm_displayid.c
> >>> > +++ b/drivers/gpu/drm/drm_displayid.c
> >>> > @@ -59,11 +59,14 @@ static const u8 
> >>> > *drm_find_displayid_extension(const struct edid *edid,  }
> >>> >  
> >>> >  void displayid_iter_edid_begin(const struct edid *edid,
> >>> > -			       struct displayid_iter *iter)
> >>> > +			       struct displayid_iter *iter, int *ext_index)
> >>> 
> >>> Please don't do this. This just ruins the clean approach displayid 
> >>> iterator added.
> >>> 
> >>> Instead of making the displayid iterator ugly, and leaking its 
> >>> abstractions, I'll repeat what I said should be done in reply to the 
> >>> very first version of this patch series [1]:
> >>> 
> >>> "I think we're going to need abstracted EDID iteration similar to 
> >>> what I've done for DisplayID iteration. We can't have all places 
> >>> reimplementing the iteration like we have now."
> >>> 
> >>> This isn't a problem that should be solved by having all the callers 
> >>> hold a bunch of local variables and pass them around to all the 
> >>> functions. Nobody's going to be able to keep track of this anymore. 
> >>> And this series, as it is, makes it harder to fix this properly later on.
> >>
> >> I missed your original review comment, so apologies for repeating what 
> >> you said there already.
> >>
> >> I'd agree that passing a starting index to the displayid_iter_* 
> >> functions is probably not the right direction here. More thoughts below.
> >>
> >>> 
> >>> 
> >>> BR,
> >>> Jani.
> >>> 
> >>> 
> >>> [1] https://lore.kernel.org/r/87czjf8dik.fsf@intel.com
> >>> 
> >>> 
> >>> 
> >>> >  {
> >>> >  	memset(iter, 0, sizeof(*iter));
> >>> >  
> >>> >  	iter->edid = edid;
> >>> > +
> >>> > +	if (ext_index)
> >>> > +		iter->ext_index = *ext_index;
> >>> >  }
> >>> >  
> >>> >  static const struct displayid_block * @@ -126,7 +129,10 @@ 
> >>> > __displayid_iter_next(struct displayid_iter *iter)
> >>> >  	}
> >>> >  }
> >>> >  
> >>> > -void displayid_iter_end(struct displayid_iter *iter)
> >>> > +void displayid_iter_end(struct displayid_iter *iter, int 
> >>> > +*ext_index)
> >>> >  {
> >>> > +	if (ext_index)
> >>> > +		*ext_index = iter->ext_index;
> >>> > +
> >>> >  	memset(iter, 0, sizeof(*iter));
> >>> >  }
> >>> > diff --git a/drivers/gpu/drm/drm_edid.c 
> >>> > b/drivers/gpu/drm/drm_edid.c index 561f53831e29..78c415aa6889 
> >>> > 100644
> >>> > --- a/drivers/gpu/drm/drm_edid.c
> >>> > +++ b/drivers/gpu/drm/drm_edid.c
> >>> > @@ -3353,28 +3353,27 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
> >>> >  	return edid_ext;
> >>> >  }
> >>> >  
> >>> > -static const u8 *drm_find_cea_extension(const struct edid *edid)
> >>> > +static const u8 *drm_find_cea_extension(const struct edid *edid,
> >>> > +					int *cea_ext_index, int *displayid_ext_index)
> >>
> >> As discussed above, passing both indices into this function may not be 
> >> the best approach here. But I think we need to keep track of some kind 
> >> of state in order to know which was the last CEA block that was 
> >> returned, and thus this function can return the next one after that, 
> >> whether it's in the CEA extension block or DisplayID block.
> >
> >Per DisplayID v1.3 Appendix B: DisplayID as an EDID Extension, it's recommended that DisplayID extensions are exposed after all of the CEA extensions.
> >
> >I think it should be fine to first iterate over all CEA extensions across the EDID, followed by iterating over all the DisplayID extensions. No need to keep track of the order between CEA and DisplayID, as the former should precede the latter.
> >
> 
> Refer to "DisplayID extensions are exposed after all of the CEA extensions". It looks to me patch v5 is able to support this. And did not touch DisplayID iterator.
> https://patchwork.freedesktop.org/series/100690/#rev5

Patch v5 does not iterate over all the DisplayID extensions, and it has
the previously mentioned problem about resulting in a possible infinite
loop when depending on ext_index to iterate over the CEA extensions.

> 
> >> What do you think of using the pointer returned from this function as 
> >> that state? The caller could pass in a u8* that was returned from a 
> >> previous call. This function would iterate through the extension 
> >> blocks and skip the CEA blocks it finds until it finds the passed in 
> >> pointer, and then return the next one after (or NULL).
> >>
> >> An alternative might be to create a linked list of ptrs to the edid 
> >> extension blocks, and allow a caller to iterate over them in whatever 
> >> way they need, but I'm not sure how useful that is elsewhere.
> >
> >I think the main problem here is trying to hack a for loop around
> >drm_find_cea_extension() and drm_find_edid_extension(), and duplicating that all over the place, without adding more structure or abstractions.
> >
> >Contrast with displayid_iter_edid_begin(), displayid_iter_for_each(), and displayid_iter_end() and their usage. They hide all the complexity of looping across DisplayID data blocks inside EDID extensions, and none of the users need to be aware of that complexity. All the state is hidden in struct displayid_iter, and the users don't need to look inside. No allocations, no linked lists.
> >
> >I think it's particularly bad to have the changes here break the abstractions in displayid_iter_*, especially because they should be usable for pure DisplayID 2.0 *without* an EDID block structure. They'll just need a displayid_iter_begin() for pure DisplayID and some internal changes.
> >
> >Looking at the usage, the iteration should probably be done at the CEA data block level, something like this:
> >
> >	struct cea_iter iter;
> >        const struct cea_block *block;
> >
> >	cea_iter_edid_begin(edid, &iter);
> >        cea_iter_for_each(block, &iter) {
> >		/* ... */        
> >        }
> >        cea_iter_end(&iter);
> >
> >This would replace cea_db_offsets() and for_each_cea_db(), and would iterate across the all CEA and DisplayID extensions in the entire EDID.
> >
> >This looks usable, and then you'd start figuring out how to implement that, instead of trying to retrofit all the existing usages to abstractions that don't cut it. You'll probably need an EDID extension iterator too, and then use that and __displayid_iter_next() within
> >cea_iter_for_each() i.e. you'd embed the edid_iter and displayid_iter within struct cea_iter. Exhaust the former first, and then the latter.
> >
> >
> >BR,
> >Jani.
> >
> 
> Hi Jani, Drew, thank you all for your comment! Agree that edid driver may need
> abstracted EDID iteration similar to what you did for DisplayID iteration.
> It will need a lot of code changes in drm driver.
> 
> But, we have a tight schedule and have to meet HDMI 2.1 compliance test requirement.
> Do you think this series can be a short term solution to pass HDMI CTS test?
> And we can have another long term plan to work on your opinion to modify
> the iterator and make edid driver more efficient and easier to maintain.
> 
> Best regards,
> Shawn
> 
> >
> >>
> >>> >  {
> >>> >  	const struct displayid_block *block;
> >>> >  	struct displayid_iter iter;
> >>> >  	const u8 *cea;
> >>> > -	int ext_index = 0;
> >>> >  
> >>> > -	/* Look for a top level CEA extension block */
> >>> > -	/* FIXME: make callers iterate through multiple CEA ext blocks? */
> >>> > -	cea = drm_find_edid_extension(edid, CEA_EXT, &ext_index);
> >>> > +	/* Look for a CEA extension block from ext_index */
> >>> > +	cea = drm_find_edid_extension(edid, CEA_EXT, cea_ext_index);
> >>> >  	if (cea)
> >>> >  		return cea;
> >>> >  
> >>> >  	/* CEA blocks can also be found embedded in a DisplayID block */
> >>> > -	displayid_iter_edid_begin(edid, &iter);
> >>> > +	displayid_iter_edid_begin(edid, &iter, displayid_ext_index);
> >>> >  	displayid_iter_for_each(block, &iter) {
> >>> >  		if (block->tag == DATA_BLOCK_CTA) {
> >>> >  			cea = (const u8 *)block;
> >>> >  			break;
> >>> >  		}
> >>> >  	}
> >>> > -	displayid_iter_end(&iter);
> >>> > +	displayid_iter_end(&iter, displayid_ext_index);
> >>> >  
> >>> >  	return cea;
> >>> >  }
> >>> > @@ -3643,10 +3642,10 @@ add_alternate_cea_modes(struct drm_connector *connector, struct edid *edid)
> >>> >  	struct drm_device *dev = connector->dev;
> >>> >  	struct drm_display_mode *mode, *tmp;
> >>> >  	LIST_HEAD(list);
> >>> > -	int modes = 0;
> >>> > +	int modes = 0, cea_ext_index = 0, displayid_ext_index = 0;
> >>> >  
> >>> >  	/* Don't add CEA modes if the CEA extension block is missing */
> >>> > -	if (!drm_find_cea_extension(edid))
> >>> > +	if (!drm_find_cea_extension(edid, &cea_ext_index, 
> >>> > +&displayid_ext_index))
> >>> >  		return 0;
> >>> >  
> >>> >  	/*
> >>> > @@ -4321,11 +4320,11 @@ static void 
> >>> > drm_parse_y420cmdb_bitmap(struct drm_connector *connector,  static 
> >>> > int  add_cea_modes(struct drm_connector *connector, struct edid 
> >>> > *edid)  {
> >>> > -	const u8 *cea = drm_find_cea_extension(edid);
> >>> > -	const u8 *db, *hdmi = NULL, *video = NULL;
> >>> > +	const u8 *cea, *db, *hdmi = NULL, *video = NULL;
> >>> >  	u8 dbl, hdmi_len, video_len = 0;
> >>> > -	int modes = 0;
> >>> > +	int modes = 0, cea_ext_index = 0, displayid_ext_index = 0;
> >>> >  
> >>> > +	cea = drm_find_cea_extension(edid, &cea_ext_index, 
> >>> > +&displayid_ext_index);
> >>> >  	if (cea && cea_revision(cea) >= 3) {
> >>> >  		int i, start, end;
> >>> >  
> >>> > @@ -4563,6 +4562,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
> >>> >  	const u8 *cea;
> >>> >  	const u8 *db;
> >>> >  	int total_sad_count = 0;
> >>> > +	int cea_ext_index = 0, displayid_ext_index = 0;
> >>> >  	int mnl;
> >>> >  	int dbl;
> >>> >  
> >>> > @@ -4571,7 +4571,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
> >>> >  	if (!edid)
> >>> >  		return;
> >>> >  
> >>> > -	cea = drm_find_cea_extension(edid);
> >>> > +	cea = drm_find_cea_extension(edid, &cea_ext_index, 
> >>> > +&displayid_ext_index);
> >>> >  	if (!cea) {
> >>> >  		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
> >>> >  		return;
> >>> > @@ -4657,9 +4657,10 @@ int drm_edid_to_sad(struct edid *edid, 
> >>> > struct cea_sad **sads)  {
> >>> >  	int count = 0;
> >>> >  	int i, start, end, dbl;
> >>> > +	int cea_ext_index = 0, displayid_ext_index = 0;
> >>> >  	const u8 *cea;
> >>> >  
> >>> > -	cea = drm_find_cea_extension(edid);
> >>> > +	cea = drm_find_cea_extension(edid, &cea_ext_index, 
> >>> > +&displayid_ext_index);
> >>> >  	if (!cea) {
> >>> >  		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
> >>> >  		return 0;
> >>> > @@ -4719,9 +4720,10 @@ int drm_edid_to_speaker_allocation(struct 
> >>> > edid *edid, u8 **sadb)  {
> >>> >  	int count = 0;
> >>> >  	int i, start, end, dbl;
> >>> > +	int cea_ext_index = 0, displayid_ext_index = 0;
> >>> >  	const u8 *cea;
> >>> >  
> >>> > -	cea = drm_find_cea_extension(edid);
> >>> > +	cea = drm_find_cea_extension(edid, &cea_ext_index, 
> >>> > +&displayid_ext_index);
> >>> >  	if (!cea) {
> >>> >  		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
> >>> >  		return 0;
> >>> > @@ -4815,8 +4817,9 @@ bool drm_detect_hdmi_monitor(struct edid *edid)
> >>> >  	const u8 *edid_ext;
> >>> >  	int i;
> >>> >  	int start_offset, end_offset;
> >>> > +	int cea_ext_index = 0, displayid_ext_index = 0;
> >>> >  
> >>> > -	edid_ext = drm_find_cea_extension(edid);
> >>> > +	edid_ext = drm_find_cea_extension(edid, &cea_ext_index, 
> >>> > +&displayid_ext_index);
> >>> >  	if (!edid_ext)
> >>> >  		return false;
> >>> >  
> >>> > @@ -4854,8 +4857,9 @@ bool drm_detect_monitor_audio(struct edid *edid)
> >>> >  	int i, j;
> >>> >  	bool has_audio = false;
> >>> >  	int start_offset, end_offset;
> >>> > +	int cea_ext_index = 0, displayid_ext_index = 0;
> >>> >  
> >>> > -	edid_ext = drm_find_cea_extension(edid);
> >>> > +	edid_ext = drm_find_cea_extension(edid, &cea_ext_index, 
> >>> > +&displayid_ext_index);
> >>> >  	if (!edid_ext)
> >>> >  		goto end;
> >>> >  
> >>> > @@ -5178,8 +5182,9 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
> >>> >  	struct drm_display_info *info = &connector->display_info;
> >>> >  	const u8 *edid_ext;
> >>> >  	int i, start, end;
> >>> > +	int cea_ext_index = 0, displayid_ext_index = 0;
> >>> >  
> >>> > -	edid_ext = drm_find_cea_extension(edid);
> >>> > +	edid_ext = drm_find_cea_extension(edid, &cea_ext_index, 
> >>> > +&displayid_ext_index);
> >>> >  	if (!edid_ext)
> >>> >  		return;
> >>> >  
> >>> > @@ -5311,12 +5316,12 @@ static void drm_update_mso(struct drm_connector *connector, const struct edid *e
> >>> >  	const struct displayid_block *block;
> >>> >  	struct displayid_iter iter;
> >>> >  
> >>> > -	displayid_iter_edid_begin(edid, &iter);
> >>> > +	displayid_iter_edid_begin(edid, &iter, NULL);
> >>> >  	displayid_iter_for_each(block, &iter) {
> >>> >  		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
> >>> >  			drm_parse_vesa_mso_data(connector, block);
> >>> >  	}
> >>> > -	displayid_iter_end(&iter);
> >>> > +	displayid_iter_end(&iter, NULL);
> >>> >  }
> >>> >  
> >>> >  /* A connector has no EDID information, so we've got no EDID to 
> >>> > compute quirks from. Reset @@ -5516,13 +5521,13 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
> >>> >  	struct displayid_iter iter;
> >>> >  	int num_modes = 0;
> >>> >  
> >>> > -	displayid_iter_edid_begin(edid, &iter);
> >>> > +	displayid_iter_edid_begin(edid, &iter, NULL);
> >>> >  	displayid_iter_for_each(block, &iter) {
> >>> >  		if (block->tag == DATA_BLOCK_TYPE_1_DETAILED_TIMING ||
> >>> >  		    block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING)
> >>> >  			num_modes += add_displayid_detailed_1_modes(connector, block);
> >>> >  	}
> >>> > -	displayid_iter_end(&iter);
> >>> > +	displayid_iter_end(&iter, NULL);
> >>> >  
> >>> >  	return num_modes;
> >>> >  }
> >>> > @@ -6164,12 +6169,12 @@ void drm_update_tile_info(struct 
> >>> > drm_connector *connector,
> >>> >  
> >>> >  	connector->has_tile = false;
> >>> >  
> >>> > -	displayid_iter_edid_begin(edid, &iter);
> >>> > +	displayid_iter_edid_begin(edid, &iter, NULL);
> >>> >  	displayid_iter_for_each(block, &iter) {
> >>> >  		if (block->tag == DATA_BLOCK_TILED_DISPLAY)
> >>> >  			drm_parse_tiled_block(connector, block);
> >>> >  	}
> >>> > -	displayid_iter_end(&iter);
> >>> > +	displayid_iter_end(&iter, NULL);
> >>> >  
> >>> >  	if (!connector->has_tile && connector->tile_group) {
> >>> >  		drm_mode_put_tile_group(connector->dev, connector->tile_group); 
> >>> > diff --git a/include/drm/drm_displayid.h 
> >>> > b/include/drm/drm_displayid.h index 7ffbd9f7bfc7..15442a161c11 
> >>> > 100644
> >>> > --- a/include/drm/drm_displayid.h
> >>> > +++ b/include/drm/drm_displayid.h
> >>> > @@ -150,11 +150,11 @@ struct displayid_iter {  };
> >>> >  
> >>> >  void displayid_iter_edid_begin(const struct edid *edid,
> >>> > -			       struct displayid_iter *iter);
> >>> > +			       struct displayid_iter *iter, int *ext_index);
> >>> >  const struct displayid_block *
> >>> >  __displayid_iter_next(struct displayid_iter *iter);  #define 
> >>> > displayid_iter_for_each(__block, __iter) \
> >>> >  	while (((__block) = __displayid_iter_next(__iter))) -void 
> >>> > displayid_iter_end(struct displayid_iter *iter);
> >>> > +void displayid_iter_end(struct displayid_iter *iter, int 
> >>> > +*ext_index);
> >>> >  
> >>> >  #endif
> >>> 
> >>> --
> >>> Jani Nikula, Intel Open Source Graphics Center
> >
> >--
> >Jani Nikula, Intel Open Source Graphics Center
