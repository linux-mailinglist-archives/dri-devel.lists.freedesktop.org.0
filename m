Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E5AD8C13
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 14:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EF610E1F5;
	Fri, 13 Jun 2025 12:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N55mZewz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E4910E1F5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 12:28:45 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-b2d46760950so2148623a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 05:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749817725; x=1750422525; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hUheJAvJ/QAI2j1ArBPoXkPiiSX0R8DUeLQ8vjaGCHc=;
 b=N55mZewztO+TI+qxRWAeE2A2amFdD5w/f8uVlcZdHTECaZPpZVJKtmWMQTA14w8dW2
 vhz1zZrPuNIABPsOOLr8R+6xvk2Jxv6p+3Xtppqb4a2y98nlMPDlEokDgtRY5vgt9k/h
 CqQ/iYzVyv1elOPnfnQq+RIZ74JWs2gRoT3TeDCej/+5Dma2RXI+eCyzdytXtWbkZIMj
 aV/FDtbXlJIfvu0PlbawbjuyXznS2uHE6RN/3CGYOaUWy2awgaMvXgEA0+CmH4YDYVTN
 qZstgUVVuKWc10fOcaAgiIl8iBAStzbFFyBLNVAIdjKo4WppDvcZf0YbKgGdIzX3YpYh
 XKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749817725; x=1750422525;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hUheJAvJ/QAI2j1ArBPoXkPiiSX0R8DUeLQ8vjaGCHc=;
 b=uuAWfKKRk1yJDvz6TtLJ8R0/hFkZFmr3ySJE9QtiEK7WJvnrddN0KnRzbQd1ZM8asr
 Hg0bl6+JV7asmo+j/AXRp2oAcV8Wf6StnOTETaMAchhC9SmRpav1tWm1UMIsnR6m+tbf
 mnHZphJUfImP0CdQjka+DOGGJ1oOwkJ3oxmO7YMtzqdoHpXKp0ZQhWe3jS4gBXG6dy62
 cR+k4Rll3tYkGhAHOS28NPBJhW5DdpRuTU/zdhkobuLJ+6113pVe1tYF+P8p8J4R0Bss
 Axil7A/RyC+Tj0l4p8As7+LsrD9oStWblinlo7jfTCRNJOsQTpLIdmf/emZDh25BFteX
 7UPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU/fdfMmcyu2A8pJJ+60M33Lwv50et8jvXW5zzerR/Qj7cI5fHXcgfmTpmQw5jJp0VDxGH2xDgiIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrlA+TQ8pPqEGiQedTzdGIbeSt5gMmwQUatHzA0pNCq0js2eLq
 oHxnc3lH6EczmfiwXAo7j6faxwxT3eylnpf9BuxkHXt3FRX2zxIhiplF
X-Gm-Gg: ASbGncsocEPCWl9/ELXmZ3/DusA+aDtIvjjWnKahiCExDfNpKNdqtb/lNkIqCGcrYFN
 x5zBE0JCpXA0jgxGsVuBDSQH0oxJ00Ro2RC72Ug4XrwLxy6nBbQV+mAyBqaWTEXadub0rJ4tdja
 5GTnyOubjsYcpNQCzqMoAt7kFhWlfiig/Cpde3l84liaLUvifURgnnadIEbduMcUMyMifEGSZl/
 k6pzY4mJozQ/B38afTuD5u4K5Io5sUXxVJFF7N8o1zNsX1QusLPbFR+soCWVnemEssAQzVSNCGj
 ToYjFyrLNqHVEXjPQsp4XHuPrppaeMzuOEI6FLPzuJApiifKAUikuXgZ6fdgKg==
X-Google-Smtp-Source: AGHT+IE+gcmD/PmavjTCsZJ5Ebw+bwtrBwmaH3AIBOuyUnFsBAjlI4hGAFjqzUYV1uUOPvmBym85Fw==
X-Received: by 2002:a05:6a20:9151:b0:1fa:9819:c0a5 with SMTP id
 adf61e73a8af0-21facbb40c3mr4162006637.11.1749817724606; 
 Fri, 13 Jun 2025 05:28:44 -0700 (PDT)
Received: from localhost ([216.228.127.129]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe1644c92sm1565073a12.32.2025.06.13.05.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 05:28:44 -0700 (PDT)
Date: Fri, 13 Jun 2025 08:28:40 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
 llvm@lists.linux.dev, Tvrtko Ursulin <tursulin@igalia.com>
Subject: Re: [PATCH 01/20] bitfield: introduce HWORD_UPDATE bitfield macros
Message-ID: <aEwZcM_leVvB0Cju@yury>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-1-f4afb8f6313f@collabora.com>
 <5493fd6017de3f393f632125fad95945d1c4294c@intel.com>
 <3683577.irdbgypaU6@workhorse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3683577.irdbgypaU6@workhorse>
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

On Fri, Jun 13, 2025 at 01:55:54PM +0200, Nicolas Frattaroli wrote:
> Hello,
> 
> On Friday, 13 June 2025 10:51:15 Central European Summer Time Jani Nikula wrote:
> > On Thu, 12 Jun 2025, Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> > > Hardware of various vendors, but very notably Rockchip, often uses
> > > 32-bit registers where the upper 16-bit half of the register is a
> > > write-enable mask for the lower half.
> > >
> > > This type of hardware setup allows for more granular concurrent register
> > > write access.
> > >
> > > Over the years, many drivers have hand-rolled their own version of this
> > > macro, usually without any checks, often called something like
> > > HIWORD_UPDATE or FIELD_PREP_HIWORD, commonly with slightly different
> > > semantics between them.
> > >
> > > Clearly there is a demand for such a macro, and thus the demand should
> > > be satisfied in a common header file.
> > >
> > > Add two macros: HWORD_UPDATE, and HWORD_UPDATE_CONST. The latter is a
> > > version that can be used in initializers, like FIELD_PREP_CONST. The
> > > macro names are chosen to not clash with any potential other macros that
> > > drivers may already have implemented themselves, while retaining a
> > > familiar name.
> > >
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  include/linux/bitfield.h | 47 +++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 47 insertions(+)
> > >
> > > diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> > > index 6d9a53db54b66c0833973c880444bd289d9667b1..b90d88db7405f95b78cdd6f3426263086bab5aa6 100644
> > > --- a/include/linux/bitfield.h
> > > +++ b/include/linux/bitfield.h
> > > @@ -8,6 +8,7 @@
> > >  #define _LINUX_BITFIELD_H
> > >  
> > >  #include <linux/build_bug.h>
> > > +#include <linux/limits.h>
> > >  #include <linux/typecheck.h>
> > >  #include <asm/byteorder.h>
> > >  
> > > @@ -142,6 +143,52 @@
> > >  		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))	\
> > >  	)
> > >  
> > > +/**
> > > + * HWORD_UPDATE() - prepare a bitfield element with a mask in the upper half
> > > + * @_mask: shifted mask defining the field's length and position
> > > + * @_val:  value to put in the field
> > > + *
> > > + * HWORD_UPDATE() masks and shifts up the value, as well as bitwise ORs the
> > > + * result with the mask shifted up by 16.
> > > + *
> > > + * This is useful for a common design of hardware registers where the upper
> > > + * 16-bit half of a 32-bit register is used as a write-enable mask. In such a
> > > + * register, a bit in the lower half is only updated if the corresponding bit
> > > + * in the upper half is high.
> > > + */
> > > +#define HWORD_UPDATE(_mask, _val)					 \
> > > +	({								 \
> > > +		__BF_FIELD_CHECK(_mask, ((u16) 0U), _val,		 \
> > > +				 "HWORD_UPDATE: ");			 \
> > > +		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask)) | \
> > > +		((_mask) << 16);					 \
> > > +	})
> > 
> > i915 uses something like this for a few registers too, with the name
> > _MASKED_FIELD(). I think we could use it.
> > 
> > I do think this is clearly an extension of FIELD_PREP(), though, and
> > should be be named similarly, instead of the completely deviating
> > HWORD_UPDATE().
> > 
> > Also, we recently got GENMASK() versions with sizes, GENMASK_U16()
> > etc. so I find it inconsistent to denote size here with HWORD.
> > 
> > FIELD_PREP_MASKED_U16? MASKED_FIELD_PREP_U16? Something along those
> > lines?
> 
> Yeah, I agree the name could be better. I used HWORD_UPDATE as Yury and
> I couldn't come up with a name we liked either, and Yury suggested not
> breaking from what's already there too much. I do think making the name
> more field-adjacent would be good though, as well as somehow indicating
> that it is 16 bits of data.
 
I suggested a wonderful name that explains everything. Didn't I? It
has the only problem - it's 25 chars long. :)

So yeah, let's think once more about a better _short_ name, or just
stick to the existing naming scheme.

> > And perhaps that (and more potential users) could persuade Jakub that
> > this is not that weird after all?
> 
> I will operate under the assumption that Jakub's opinion will not change
> as he ignored the commit message that talks about multiple vendors,
> ignored the cover letter that talks about multiple vendors, and ignored
> my e-mail where I once again made it clear to him that it's multiple
> vendors, and still claims it's a Rockchip specific convention.

As far as I understood, he concerns not about number of drivers that
opencode HIWORD_UPDATE(), but that this macro is not generic enough
to live in bitfield.h. And it's a valid concern - I doubt it will
be helpful somewhere in core and arch files.

I think that creating a separate header like hw_bitfield.h, or hw_bits.h
aimed to absorb common helpers of that sort, would help to reach the
strategic goal - decreasing the level of code duplication in the driver
swamp.

Thanks,
Yury
