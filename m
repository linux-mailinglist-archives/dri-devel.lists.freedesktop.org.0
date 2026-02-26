Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHg0K+1noGkejQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 16:34:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021D61A8C98
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 16:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BB010E985;
	Thu, 26 Feb 2026 15:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QhR3ScLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com
 [74.125.224.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D9510E985
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 15:34:00 +0000 (UTC)
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-64c9c8f8783so1046756d50.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 07:34:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772120040; cv=none;
 d=google.com; s=arc-20240605;
 b=MSWf0DiFTrFhaz/J+pjRXM/iqc9NmRbnYEY5bDJ5jPOzxWWgHaBf6d5qXT2bo2C/mB
 QfQSVC8zsKIkWrNeG08BmXePsmSR7k/QN/mqnh2YTPzkkFJL4+A8Mqju3uYXq6pK8qXD
 W3OlFPLIFRSyawEjmTYjI969KpOLB96PujC7UJSL07pYjAeCzKm/aQaHv9X7Kd/Wblg/
 7uOYrANCFTqG/Ispnho2cxbl1od7AxZQDq/du5n7aUwyJ2kW6FovdBD6+4DoRKGzpwQm
 H+yIgh9FIaj3uyTVUKSQt8sWfD7fQc7zKfqroak2vzquhmErf/x4k1j+c7OGnJ2kibKg
 0syg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FTD8aBr+1wg6Gk8Wsv1fWZ9PDtHZSU8MxIbXmdbe0to=;
 fh=i3c7G3NL+cE+YFUOnWIvbgfVUwkvesJuu1CWXdu6Rg8=;
 b=hfEoW61B831vLGCQFj8m/qB6TnT/cabLjWHmfEnER+3bK2eEtlaiq1lEkXC+IIhPjk
 ETFR/CB0Ueyn4jpSg8rZTbP14neEK/LwSomIrhoybKzOZ+q0DLkMy8qws5UDxDQ7He36
 OEbwacIlFzmWhILfsawi0d6flx04mwHxmsVyDSvL6m3EXNmLPglHyFzjBeZoS/NT3nJ0
 JzVH1Q7oseLIrenxDvcdRoXQvAnUSz4Bb+dD6KX6tSpVYlvkHPsyo2LRMXbcT03vLPLh
 HafSGJZImrT5qjzoMT+GYE3nvqOY2yXu8Doyk7GT6JF+aOee0b2iQ+3U/iNl5oNz3/RS
 9MQg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772120040; x=1772724840; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTD8aBr+1wg6Gk8Wsv1fWZ9PDtHZSU8MxIbXmdbe0to=;
 b=QhR3ScLXlRKICqYSlSrcFwBtbmmAMNKI37PSA24UE3EEsjtsoFDLjX8XKPMX1PCWbp
 XIrxMH37k5nGu+M3uSYhc+96sUo4G6jzgth/Ul821fYP3UHeYCH89Us5Ma4MXxqk+pFB
 rir51ybKBniOR50Ub/EhOGrVpEUkMJl9j5a2bfxokxhQImVUJJsK0vmJ0sqc2giffG3a
 OBu1us0LuMpygyPXrKIslAHccsQLalAaeBnEhwy7RQqfRnGMtrZq2NiRGaMjmcncfwRk
 FEe4PPjuE0jPsrQfDJvx6K5tqLnq2sWyCZbkoqU3BLPyicu3Ae8hClGPmidVvUR1E7Nl
 er4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772120040; x=1772724840;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FTD8aBr+1wg6Gk8Wsv1fWZ9PDtHZSU8MxIbXmdbe0to=;
 b=WNu4/711x7NsJOzy27DDD4eDzBUOxybNINQNhuwlHuW9c9/rrwnjDoGcWnvoy01tW/
 lHQy+saXx5jivCnQ03MReJzRoQJyBAYP+dlgyZApnNi1lpLHggodLHf+RyJefCkHyvF2
 3FTMe/8BBojrvDkDwsiuiRVgVR6hSQUAL0aFA1FEUyCulOi5m0vxaQEmEZ9LRKmoJDqY
 k1rn8bgAvUIjvWDZq7FSGvDP69UKv6kxK/VStxNk0SoGmz0u88ZInPa0BzuwK2rrB7EY
 nn8qgX2Kl6bl27FxyOG6N9titAYC79V2EmG+0IfiM+CZfUSXnMji1I/d4z20wOJwsGVf
 FQfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQaPcgku2BuNtdJGA4IgsBwLTJGcexaatXTUfq+0uNr9K/hoJNCbqv1K6t/TLpW0Q9atP05r/Ot7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysrwccL7WOhnEK+19YI0N2Y/cWgR3tAMQazrC1HNm/VsfjlJWs
 YBfuAM/nnUd56YAUgvwHIvaHco/I6TNU1JkyiI7RQbX3DQ3Shpgvwpay5a1GqmyXMH6AdjR8wtP
 q6Mq7lxPHu0ALZJkisEia6m3+Hu1Z1tk=
X-Gm-Gg: ATEYQzzzRgaXz6W6YbgRMGUxvYFdor2emhkQ4/Y/Lo4Ku4yenQpbeALy8WbvNFoU/AT
 rqNHu1+jNz82SF4o04ktqGt0u774tZ9p2pxwdR+GCvQCT15/CswoVxWMQa2qSs5Cz9Q2EZRtWq+
 aXkuaxy0+47kvmLAkOwVdqBmwCU0CWj90KOunc10ws6eQTfw+PSuHkMo7pFc4AuCZO1TFJinoG7
 oP4mZ8fLm4PDbmZH7C6Fs3vpMhcIbMA8fZy2MYi4sKmteKNhLSUQNkqXYDqHzTDn3xr9ZfeTQ2c
 Fvj+6SLFVzJko38JAuVuwQVfhByxN7Tr6Qs5vm9/dA==
X-Received: by 2002:a05:690e:688:b0:644:7479:4b1d with SMTP id
 956f58d0204a3-64cb6ed888cmr1606668d50.8.1772120039812; Thu, 26 Feb 2026
 07:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20260224153656.261351-1-tzimmermann@suse.de>
 <d0a5309c-a5a0-4629-a95f-5a0a39c16d77@lechnology.com>
 <8a6cddae-6520-45ab-999f-087a5fd6b30b@suse.de>
In-Reply-To: <8a6cddae-6520-45ab-999f-087a5fd6b30b@suse.de>
From: Archit Anant <architanant5@gmail.com>
Date: Thu, 26 Feb 2026 21:03:48 +0530
X-Gm-Features: AaiRm51tRYHx910NjCZOzayT8mzjYe0D-vG0_DHQ9SzVe8lqxsN0Bl2TeRBqZfw
Message-ID: <CADJHxWDpajsiZHWbvqUOROTVEnx8oN3VcaqfCCirKEUSg0=7SA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/16] drm/mipi-dbi: Replace simple-display helpers
 with regular atomic heleprs
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Lechner <david@lechnology.com>, javierm@redhat.com,
 lanzano.alex@gmail.com, 
 kamlesh.gurudasani@gmail.com, wens@kernel.org, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:david@lechnology.com,m:javierm@redhat.com,m:lanzano.alex@gmail.com,m:kamlesh.gurudasani@gmail.com,m:wens@kernel.org,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:airlied@gmail.com,m:lanzanoalex@gmail.com,m:kamleshgurudasani@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lechnology.com,redhat.com,gmail.com,kernel.org,linux.intel.com,ffwll.ch,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: 021D61A8C98
X-Rspamd-Action: no action

Hi Thomas, David,

On Wed, Feb 25, 2026 at 1:05=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 24.02.26 um 23:59 schrieb David Lechner:
> > On 2/24/26 9:24 AM, Thomas Zimmermann wrote:
> >> We keep getting new drivers based on the obsolete simple-display pipel=
ine,
> >> such as the recent driver for st7789v panels. [1] But submitters canno=
t
> >> know, as the simple-display helpers are fully documented and still use=
d
> >> in several places.

Thanks for initiating this refactoring!

As working on the ST7789V RFC [1], I will hold off on sending a v4
of my series until this work lands. I will then rebase the ST7789V
driver to use the new mipi_dbi atomic interface.

> > I have a feeling I am the best candidate for testing. I will try to
> > see if I can have some time in the next week or two.
>

David, since you are testing on hardware, I'll keep a keen eye for your
results.

If there are any specific tests or reviews I can help with regarding the
API changes for new drivers, please let me know.

[1] https://lore.kernel.org/dri-devel/20260221071351.22772-1-architanant5@g=
mail.com/

--=20
Sincerely,
Archit Anant
