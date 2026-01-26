Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCMaBdQwd2lVdAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 10:16:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F4985E77
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 10:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A4E10E0A7;
	Mon, 26 Jan 2026 09:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E266210E0A7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 09:15:59 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-5637886c92aso1007769e0c.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 01:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769418959; x=1770023759;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uQaOzj2tKnU8ORNYpG6usL1AFHimKPjCyXKjxferGL0=;
 b=rqw2VGUVxWQmSEhujDxafno5c2/rjFVzZTwk4yN4ZWxecBrqkxta2uEluKBCwJsSu/
 n+cjGML+PTZhE0gHhzfowd2YVE/iShEyIqgDh/D+Gqdy0y+7P5TRqUH3DaZhyfHimDTD
 YFcAtAOFwIKcY6Bv8YbycG44+Gff6BwX5fdjDnU/uaTPvbJPPpebQvAXwnCXiRGalNAl
 AwbNLJXmnkQKvcemjlzHhg3LOsz5C4Ea5u7eFt9OniRk27ycy0rJ7UYfSeRtBcEPrLh+
 C6d834/7UQlLMvKjBRTVM9nC5ggsqX6qK7DGOYX5ih+eK5INVvro+yHAS6zHuuWCMQYI
 CS0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNVBtIUGt0sL8Hct5e8WTMyPxdof7j1JQVoNFXhe34ykgK3kjDJq4sk9sNYM9CbrONCnRyHIry1Qc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNfrfgFcO/iD2ywu2vm/TdbNBatcz//r0IKDBLsLkFZnyHTiAj
 6ZqUYy/V16WsEv9N0RZhQdXKEILW7KW5N2M+otqNSUsogCsFaWn/bUEOJn/YDBZ5
X-Gm-Gg: AZuq6aL2eiTLWEYORxI3q0YzpiNeoKEaV2soNXlySEWpP2cEVqZnclXWWgbBA6vkebx
 obEx68n8N8YXC7mL45WkjiMe3hZXecc89spzOMfjvDRYuaV5qc6ATqu9t4krpnwKEHtG/o9YiDK
 e8Mzg7vT6p1ofUaZ/ULXiqdJIObWQujMm5J4CYoRD205vqfxxwug6lpUkRyOYRzUOPKwr7t+OL1
 hQBE4A4JyX9mYr6P+hfrLSb3l3JGDFGM3wO11XRbEBd/ctliPwttnZA05vE5r76+PauON3S6foN
 xx4PcU1dmYmR9L+kFckF0/ElFYz36RODRQcocXhyZkTymhUHzU3aA5IBKLvpX3AkaOePm0ttocJ
 0IN7PuGF9glgH7SGd3OzPuXmXpnZgc9HiwIy1Xu9SPZD71nUXuibUFvzzPP1loizeTL2yvZYPIy
 arw/kSfO5qMA5+dxcXkqSlZyiwbUB6dQMJFJ2imuD1LBC/RQ2G
X-Received: by 2002:a05:6122:3196:b0:566:3c6d:b5a3 with SMTP id
 71dfb90a1353d-5665ca2b9bamr1030807e0c.21.1769418958614; 
 Mon, 26 Jan 2026 01:15:58 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5663fa96675sm1621081e0c.9.2026.01.26.01.15.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 01:15:58 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-5eae7bb8018so1268634137.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 01:15:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUPQVdZKnnXn9tuI3UWoAnlAQ8qVQhUWOfxJj+eTzQVtdgH7imXWSVIGpVgrj/ylYq3N3B5yDHf5UI=@lists.freedesktop.org
X-Received: by 2002:a05:6102:f0e:b0:5f5:33e4:12ea with SMTP id
 ada2fe7eead31-5f576493c1bmr1088062137.31.1769418957878; Mon, 26 Jan 2026
 01:15:57 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
 <0e9f963b-00e0-43d1-b567-cb10b8f66df1@mailbox.org>
 <CAMuHMdVOUzanEufhWqOL0nv81xCYh4YNAX_waG6y9PyUZ030tg@mail.gmail.com>
 <9efa9daa-6584-44b3-8055-bc160e46d8a5@mailbox.org>
In-Reply-To: <9efa9daa-6584-44b3-8055-bc160e46d8a5@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 10:15:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqqRJnY+ATZdzw1=XnmXUko3+wPhKtT+PVP+CRmdFAYg@mail.gmail.com>
X-Gm-Features: AZwV_Qj2iYTeK4T2fVq6WUyIHg21dwOYiE1pJSzFBFBrBjhDjig-MNpg9IvarOQ
Message-ID: <CAMuHMdWqqRJnY+ATZdzw1=XnmXUko3+wPhKtT+PVP+CRmdFAYg@mail.gmail.com>
Subject: Re: drm/imagination: genpd_runtime_suspend() crash
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux PM list <linux-pm@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:ulf.hansson@linaro.org,m:rafael@kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: 73F4985E77
X-Rspamd-Action: no action

Hi Marek,

On Mon, 26 Jan 2026 at 00:18, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 1/22/26 4:35 PM, Geert Uytterhoeven wrote:
> >> Can you please test this change and see if it fixes the problem ?
> >>
> >> The barrier should guarantee that the domain is settled and no more
> >> callbacks are still running.
> >
> > Thank you, that indeed fixes the issue!
> >
> > However, I am not so sure this barrier belongs in the .detach_dev()
> > callback.  The documentation for almost all dev_pm_domain_{at,de}tach*()
> > functions states:
> >
> >       * Callers must ensure proper synchronization of this function with power
> >       * management callbacks.
>
> Isn't cpg_mssr_detach_dev() the caller in this case ?

No, cpg_mssr_detach_dev() is merely the generic_pm_domain.detach_dev()
callback, which is called eventually from dev_pm_domain_detach().

End users like pvr_power_domains_{fini,init}(), and the helpers
dev_pm_domain_{at,de}tach_list() call dev_pm_domain_{at,de}tach*().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
