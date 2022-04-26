Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C61510AF9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 23:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FC910E6E7;
	Tue, 26 Apr 2022 21:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F1E10E6E9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 21:08:13 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 r14-20020a9d750e000000b00605446d683eso13912660otk.10
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 14:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oOiTDP3iRudLqeNHeG0SSRW6WmEyHCfQv2s8km2VlTE=;
 b=WDTZ94gF93fjDziFhbGcTO4t4Fb/nL5VtVyHG6Ts5gCsTQhihFrg7+V1o9Sd/Jb6uj
 0K926cPr51FkS2ZmVZI7JldZ7tV7kZleje8iOFZXRVrZ5zDen7sPH25Y+LMpVj938v7k
 LXWv3boI1jWsY3svbz09SJIiMfLXj1P/AYtuY+xeklmkK3LNKsO3ipZqISKdJ9fyqa79
 2jIkctsiXnV2lnRwAP70rBzUqJFmQIqodJIW8E5iHPaHuVGy0yUnv83pAsawmbDM421r
 oHgVUK+7PsbamxlEVxbKVnCIjw0toSxdoxU/M4EjaiQzsba73CcdDD1vak0O1JTzCfHL
 Jdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oOiTDP3iRudLqeNHeG0SSRW6WmEyHCfQv2s8km2VlTE=;
 b=O1G1eVqE4OylCOWs2BtsptZGFexxzpebqPr4gpa+QYQkpgeJ4MxmunBp4cO9E6o5OR
 ksq8q1P0M0V2KdbNO/d93XbOR4naAw/Hbaz8ITe/yYm3jrY/8AgRxME+IV6k1jcDm+XS
 xdpWdsaGzSMsFW1dxWu1/gcdSDRYLdv/5feLXzzddNJhkY0UGqCVGaqlhBtvcRH/nKoS
 D90Q88rCCJa3KKK0w6xFypxb42vKiuSPNkrdogm406qwPDVF7bP9xnZO9S5uyFe2KI5G
 ZPtZ+pCp7MZScx7GZzZiVQXmwdGZmu+DmKvnyg68vEzVL471FI7Umjyi++oafrhvs971
 Xyrw==
X-Gm-Message-State: AOAM530GVc1ZUTv8bdknjxBkpve2lr8NH3K9sOwylYLYocedMA2y6lx+
 yX0hToavmjRO/oLNy67rJ+Q/3XTKSZSH5TcC
X-Google-Smtp-Source: ABdhPJxuUikNONG8mH33MVObRzni7bUGk5YoSD2Bver9T2lndjY1DS4aTsdLXeTx1lspBkANXd5yRw==
X-Received: by 2002:a9d:6e83:0:b0:605:4a01:1d8c with SMTP id
 a3-20020a9d6e83000000b006054a011d8cmr8928613otr.174.1651007292783; 
 Tue, 26 Apr 2022 14:08:12 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 t28-20020a056808159c00b00325361c4fbesm2553898oiw.5.2022.04.26.14.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 14:08:11 -0700 (PDT)
Date: Tue, 26 Apr 2022 14:10:08 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <YmhfsGAJjSmSPs/l@ripper>
References: <20220421082358.ivpmtak3ednvddrc@houat>
 <YmEdAVwZuA7Wo1Ch@aptenodytes> <YmelPCcWCCjALtRU@aptenodytes>
 <YmfYi5G7hMKLAH3T@pendragon.ideasonboard.com>
 <YmfoiD0r8MD/kr1N@aptenodytes>
 <20220426125401.yyrhg6aeafdjw4ad@houat>
 <20220426125544.mroteu3hvyvlyb6g@houat>
 <Ymft0SM5GNHXjkVb@aptenodytes>
 <20220426131944.b26rqqmk7gpcplbg@houat>
 <Ymf4nmQAkEciwyt/@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ymf4nmQAkEciwyt/@aptenodytes>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 26 Apr 06:50 PDT 2022, Paul Kocialkowski wrote:

> On Tue 26 Apr 22, 15:19, Maxime Ripard wrote:
> > On Tue, Apr 26, 2022 at 03:04:17PM +0200, Paul Kocialkowski wrote:
> > > On Tue 26 Apr 22, 14:55, Maxime Ripard wrote:
> > > > On Tue, Apr 26, 2022 at 02:54:01PM +0200, Maxime Ripard wrote:
> > > > > On Tue, Apr 26, 2022 at 02:41:44PM +0200, Paul Kocialkowski wrote:
> > > > > > On Tue 26 Apr 22, 14:33, Laurent Pinchart wrote:
> > > > > > > On Tue, Apr 26, 2022 at 09:54:36AM +0200, Paul Kocialkowski wrote:
> > > > > > > > On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> > > > > > > > > On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> > > > > > > > > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > > > > > > > > > + Linus
> > > > > > > > > > > + Marek
> > > > > > > > > > > + Laurent
> > > > > > > > > > > + Robert
> > > > > > > > > > > 
> > > > > > > > > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> > > > > > > > > > > > bridge")' attempted to simplify the case of expressing a simple panel
> > > > > > > > > > > > under a DSI controller, by assuming that the first non-graph child node
> > > > > > > > > > > > was a panel or bridge.
> > > > > > > > > > > >
> > > > > > > > > > > > Unfortunately for non-trivial cases the first child node might not be a
> > > > > > > > > > > > panel or bridge.  Examples of this can be a aux-bus in the case of
> > > > > > > > > > > > DisplayPort, or an opp-table represented before the panel node.
> > > > > > > > > > > >
> > > > > > > > > > > > In these cases the reverted commit prevents the caller from ever finding
> > > > > > > > > > > > a reference to the panel.
> > > > > > > > > > > >
> > > > > > > > > > > > This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
> > > > > > > > > > > > panel or bridge")', in favor of using an explicit graph reference to the
> > > > > > > > > > > > panel in the trivial case as well.
> > > > > > > > > > > 
> > > > > > > > > > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > > > > > > > > > switched drivers.  Do you have any suggestions on how to proceed to
> > > > > > > > > > > succeed in those use cases as well?
> > > > > > > > > > 
> > > > > > > > > > I guess we could create a new helper for those, like
> > > > > > > > > > devm_drm_of_get_bridge_with_panel, or something.
> > > > > > > > > 
> > > > > > > > > Oh wow I feel stupid for not thinking about that.
> > > > > > > > > 
> > > > > > > > > Yeah I agree that it seems like the best option.
> > > > > > > > 
> > > > > > > > Should I prepare a patch with such a new helper?
> > > > > > > > 
> > > > > > > > The idea would be to keep drm_of_find_panel_or_bridge only for the of graph
> > > > > > > > case and add one for the child node case, maybe:
> > > > > > > > drm_of_find_child_panel_or_bridge.
> > > > > > > > 
> > > > > > > > I really don't have a clear idea of which driver would need to be switched
> > > > > > > > over though. Could someone (Jagan?) let me know where it would be needed?
> > > > > > > > 
> > > > > > > > Are there cases where we could both expect of graph and child node?
> > > > > > > > (i.e. does the new helper also need to try via of graph?)
> > > > > > > 
> > > > > > > I still think we should use OF graph uncondtionally, even in the DSI
> > > > > > > case. We need to ensure backward-compatibility, but I'd like new
> > > > > > > bindings (and thus new drivers) to always use OF graph.
> > > > > > 
> > > > > > I just went over the thread on "drm: of: Improve error handling in bridge/panel
> > > > > > detection" again and I'm no longer sure there's actually still an issue that
> > > > > > stands, with the fix that allows returning -ENODEV when possible.
> > > > > > 
> > > > > > The remaining issue that was brought up was with a connector node, but it should
> > > > > > be up to the driver to detect that and avoid calling drm_of_find_panel_or_bridge
> > > > > > in such situations.
> > > > > > 
> > > > > > So with that in mind it feels like the child node approach can be viable
> > > > > > (and integrated in the same helper).
> > > > > > 
> > > > > > We might still want to favor an explicit OF graph approach, but note that
> > > > > > dsi-controller.yaml also specifies extra properties that are specific to
> > > > > > MIPI DSI and I'm not sure there are equivalent definitions for the OF graph
> > > > > > approach.
> > > > > > 
> > > > > > What do you think?
> > > > > 
> > > > > I don't think Laurent's point was to move the child node away from its
> > > > > DSI controller, that part doesn't make much sense. The panel or bridge
> > > > > is still accessed through the DSI bus, so it very much belongs there.
> > > > > 
> > > > > What he meant I think was that we mandate the OF graph for all panels,
> > > > > so for panels/bridges controlled through DCS, you would still list the
> > > > > output through the graph.
> > > > 
> > > > Also, we're already in a bit of a mess right now. I don't think rushing
> > > > that kind of patches in a (late) rc is making much sense, but as I said,
> > > > if you want to start working on this, then I'll take a revert for the
> > > > next rc, and then we can work calmly on this.
> > > 
> > > As I understand it we either have some broken stuff because of the revert of:
> > > - drm: of: Lookup if child node has panel or bridge
> > > - drm: of: Properly try all possible cases for bridge/panel detection
> > > 
> > > because the child node is already used in places, or we can have broken stuff
> > > because with the patches because with these two patches -ENODEV is no longer
> > > returned.
> > > 
> > > Now with the extra patch that I sent:
> > > - drm: of: Improve error handling in bridge/panel detection
> > > 
> > > we get -ENODEV back, except for the connector case but this one should be
> > > handled in drivers directly and drm_of_find_panel_or_bridge should not be
> > > called in that situation.
> > > 
> > > So all in all it seems that all the pieces are there, unless I'm missing
> > > something.
> > > 
> > > What do you think?
> > 
> > If Bjorn and Thierry can confirm that it indeeds work in their case,
> > I'll be happy to apply those patches as well.
> 
> I still think we'd need a fix for Bjorn's connector case though.
> Not sure I would be confident providing that one without the hardware
> to test with.
> 
> Bjorn, what do you think?
> 

I'm okay with the idea that it's up the driver to check that the output
port references an usb-c-connector - either before the call or upon
drm_of_find_panel_or_bridge() returning an error.

Regards,
Bjorn
