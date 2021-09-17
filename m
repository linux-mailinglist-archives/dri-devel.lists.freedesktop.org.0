Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C8640FA52
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 16:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E152D6ED1E;
	Fri, 17 Sep 2021 14:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C99F6ED1E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 14:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631889438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CJ3e8jOyCDOF8rQQhgiKBnbR6BCfFhW0qIeId7iiYOE=;
 b=BQdIco8ay/HS4CP1PR6HxMNeY85c8rAjsRa37jdAGDZH9mHzi81DNaB7NdbeA4goO/RXES
 1rur6eYnZCOfylee/+vdUNUSzgRQWsXnjKaSYOS1SFAjri9dPBbiMt+nLsmqOi0b+qncF/
 aVVhm3emkRzKxf+WXurBMJP/vZmuhhA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-hBlpaExiNTu8qLd4U0Zwcg-1; Fri, 17 Sep 2021 10:37:17 -0400
X-MC-Unique: hBlpaExiNTu8qLd4U0Zwcg-1
Received: by mail-ed1-f70.google.com with SMTP id
 b7-20020a50e787000000b003d59cb1a923so8355241edn.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 07:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CJ3e8jOyCDOF8rQQhgiKBnbR6BCfFhW0qIeId7iiYOE=;
 b=UNdRxack181qjYVgE3Xt5uDukKAX5GWMHc6PYpsryqE9XB/1GDYqNmKja3hTvmeeh+
 2DFsl8X2m+qbezOR0Td82C+dFoCJkPPlE5kKan+gQMbu4FCvqQgmXuyt2xtWNndtfHEp
 kp8NDeXpyWUrxYAkgOEN50/YkCbp3jIbqdMyqXdNJwsOzAKAODvfKbfnKoWPwa3fkxIc
 k0PXh34GXqIiUNkwPaZ0ychEsxcH0gVWfOwbK4jtP1vR0a1ek/XRSZXyD+mFZPjH1L0w
 7VvLBV9MZbtTZsPc2TzozR+aSSbGOfigvT1k8l/w75Yec6sB/9TxVPz9GyD/Rvyw6DJC
 ft1Q==
X-Gm-Message-State: AOAM533WyS64t7l9liEVfShY49mmBtdotwd+WUsXx6GE1eHF+4ZvFlNe
 ERcqYG6QRbfIAZ1Ogzvb1yDZCdNwNZhSGlLKuxjlyu3P1EUBlA/MMNhTy7vyjQXLcAyh40QBs4e
 r0tj4UNjicTRu3i2pk2AzFv/sHhqz
X-Received: by 2002:a17:907:784b:: with SMTP id
 lb11mr13019958ejc.307.1631889436264; 
 Fri, 17 Sep 2021 07:37:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+xf29Whki6LaC30NqHEYtyfl5WIlImxBgK34C2iLohIcq+l0p5eIIE5zOdzVhFt2nO7KWlg==
X-Received: by 2002:a17:907:784b:: with SMTP id
 lb11mr13019940ejc.307.1631889436065; 
 Fri, 17 Sep 2021 07:37:16 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
 by smtp.gmail.com with ESMTPSA id z3sm2288717eju.34.2021.09.17.07.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 07:37:15 -0700 (PDT)
Subject: Re: [PATCH 9/9] drm/i915: Add privacy-screen support
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rajat Jain <rajatja@google.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Lyude <lyude@redhat.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <mgross@linux.intel.com>,
 Andy Shevchenko <andy@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>, Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-10-hdegoede@redhat.com> <YUNKh9xcIGoi1eol@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1239f5f3-fd02-4eed-f464-e92c0afbb620@redhat.com>
Date: Fri, 17 Sep 2021 16:37:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUNKh9xcIGoi1eol@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hi,

On 9/16/21 3:45 PM, Ville Syrjälä wrote:
> On Mon, Sep 06, 2021 at 09:35:19AM +0200, Hans de Goede wrote:
>> Add support for eDP panels with a built-in privacy screen using the
>> new drm_privacy_screen class.
>>
>> One thing which stands out here is the addition of these 2 lines to
>> intel_atomic_commit_tail:
>>
>> 	for_each_new_connector_in_state(&state->base, connector, ...
>> 		drm_connector_update_privacy_screen(connector, state);
>>
>> It may seem more logical to instead take care of updating the
>> privacy-screen state by marking the crtc as needing a modeset and then
>> do this in both the encoder update_pipe (for fast-sets) and enable
>> (for full modesets) callbacks. But ATM these callbacks only get passed
>> the new connector_state and these callbacks are all called after
>> drm_atomic_helper_swap_state() at which point there is no way to get
>> the old state from the new state.
> 
> Pretty sure the full atomic state is plumbed all the way
> down these days.

Including the old state? AFAICT the old-state is being thrown away
from drm_atomic_helper_swap_state(), so if we do this in a different
place then we don't have access to the old-state.


> 
>>
>> Without access to the old state, we do not know if the sw_state of
>> the privacy-screen has changes so we would need to call
>> drm_privacy_screen_set_sw_state() unconditionally. This is undesirable
>> since all current known privacy-screen providers use ACPI calls which
>> are somewhat expensive to make.
> 
> I doubt anyone is going to care about a bit of overhead for a modeset.

But this is not a modeset, this is more like changing the backlight brightness,
atm the code does not set the needs_modeset when only the privacy-screen
sw-state has changed.

Also in my experience the firmware (AML) code which we end up calling
for this is not the highest quality code, often it has interesting
issues / unhandled corner cases. So in my experience with ACPI we
really should try to avoid these calls unless we absolutely must make them,
but I guess not making unnecessary calls is something which could be handled
inside the actual privacy-screen driver instead.

> The usual rule is that a modeset doesn't skip anything. That way we
> can be 100% sure we remeber to update everythinbg. For fastsets I guess
> one could argue skipping it if not needed, but not sure even that is
> warranted.

Right, but again this is not a full modeset.

> 
> The current code you have in there is cettainly 110% dodgy. Since the
> sw_state is stored in the connector state I presume it's at least
> trying to be an atomic property, which means you shouldn't go poking
> at it after the swap_state ever.

It is not being poked, it is only being read, also this is happening
before swap_state.

Note I'm open for suggestions to handle this differently,
including changing the drm_connector_update_privacy_screen()
helper which currently relies on being passed the state before swap_state
is called:

void drm_connector_update_privacy_screen(struct drm_connector *connector,
					 struct drm_atomic_state *state)
{
	struct drm_connector_state *new_connector_state, *old_connector_state;
	int ret;

	if (!connector->privacy_screen)
		return;

	new_connector_state = drm_atomic_get_new_connector_state(state, connector);
	old_connector_state = drm_atomic_get_old_connector_state(state, connector);

	if (new_connector_state->privacy_screen_sw_state ==
	    old_connector_state->privacy_screen_sw_state)
		return;

	ret = drm_privacy_screen_set_sw_state(connector->privacy_screen,
				new_connector_state->privacy_screen_sw_state);
	if (ret) {
		drm_err(connector->dev, "Error updating privacy-screen sw_state\n");
		return;
	}

So if you have any suggestions how to do this differently, please let me know
and I will take a shot at implementing those suggestions.

Please keep in mind that the drm_privacy_screen_set_sw_state() call also
needs to happens when just the connector_state->privacy_screen_sw_state changes,
which is not a reason to do a full modeset (iow needs_modeset maybe 0 during
the commit)

Regards,

Hans



