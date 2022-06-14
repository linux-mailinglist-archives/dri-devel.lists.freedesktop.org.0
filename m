Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8246754B84A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 20:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680751129FB;
	Tue, 14 Jun 2022 18:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFD11129F4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 18:09:57 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id x17so12325950wrg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 11:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=5HS94b3zbhVHb3Euo3cragOg32oYy8HF4UEWBUR8dUc=;
 b=V3qhmoGdsgNZcH8lUWlVMk6P90TX4Owzcc39OBsyC5vIH2wHwzKrMW2ejWwQzJzuXg
 lwSR1flwIYS+63bofMdKCitcj60wIN4X8YCqeuer8MH3GXN21xbu117aIIboDPyPh1j7
 4DZxi8Go2FK2Gs8qw+hiNhpo+TlTJnWNBi/Epi3uupwSxEVroA/KnwW0ToHp/AaHf81m
 RWc2VnuSo3Fs7a6MLqpj1+1UXkJghCJkYRKi9/tBoWOHYOq/csFT6Kp7CiP3XMwmuTpV
 A84X50mZNHlCzvEaELQs2VTLiu1GK1maLmMUGJFbPPhfilIWA5juT0NRieHgnKQZtfJz
 rgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5HS94b3zbhVHb3Euo3cragOg32oYy8HF4UEWBUR8dUc=;
 b=Z3wgzS49b1bWqd3yqoUH0tMEiqf9I9hyBUh6s8nUN+/xIyZc66IQLRd8K7H2AYzilf
 UxozGfuujCPOG6arCPQ+mdAYvJ9Ba0b/kN9rVi3pL1G8avxgI3qa1dE5m3Q1NAyuwk1O
 gl46m8jSqAOClJ1URd/7DF3AzHHhNqdmIzyZtpbOCVWuYNM2asX8AXVGl5x7WKX/x/ve
 hRBJm9WRW1DPq0VF7G3bQ0JSKg3sf45xfXAJAEezeZdooGVRC2yToKicASyAIodepsn/
 gteuZj8QNZnFDtM0zBfEOhLn2Q6kjBurmQaLTuo8iQlclthvZFPuOTGdY/73VmjfgaSu
 ncKg==
X-Gm-Message-State: AJIora/voJ2k77L/cuyM8if2sDWlInPFIi2C6rLy+6VHOJVdi1v8CZ0i
 scbMpHjCn9HognyUeQUcmjM=
X-Google-Smtp-Source: AGRyM1srLaIZ5Tq7ZiceCpCZ/v1Gtwa91Vj1Y1Dju2PSoqBndetCk80NVd5YKPXq4Y2H4aIzwPYz6w==
X-Received: by 2002:adf:ae09:0:b0:20e:e4f0:2133 with SMTP id
 x9-20020adfae09000000b0020ee4f02133mr6128115wrc.104.1655230195632; 
 Tue, 14 Jun 2022 11:09:55 -0700 (PDT)
Received: from elementary ([94.73.36.128]) by smtp.gmail.com with ESMTPSA id
 g7-20020a5d4887000000b0021350f7b22esm12418652wrq.109.2022.06.14.11.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 11:09:55 -0700 (PDT)
Date: Tue, 14 Jun 2022 20:09:52 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 3/3] drm/doc: Add KUnit documentation
Message-ID: <20220614180952.GA7067@elementary>
References: <20220613171738.111013-1-jose.exposito89@gmail.com>
 <20220613171738.111013-4-jose.exposito89@gmail.com>
 <c50e5c87-3198-08b7-1e32-d0959af1f296@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c50e5c87-3198-08b7-1e32-d0959af1f296@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com,
 Maxime Ripard <maxime@cerno.tech>, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Jun 14, 2022 at 02:58:29PM +0200, Javier Martinez Canillas wrote:
> Hello José,
> 
> On 6/13/22 19:17, José Expósito wrote:
> 
> [snip]
> 
> > +KUnit (Kernel unit testing framework) provides a common framework for unit tests
> > +within the Linux kernel.
> > +
> 
> I think that it will be useful to have a reference to the KUnit kernel doc here,
> something like the following:
> 
> `KUnit <https://docs.kernel.org/dev-tools/kunit/index.html>`_ (Kernel Unit...

There is a link in the next paragraph. Once the documentation is
generated the path "Documentation/dev-tools/kunit/start.rst" is
transformed into a link.
 
> > +This section covers the specifics for the DRM subsystem. For general information
> > +about KUnit, please refer to Documentation/dev-tools/kunit/start.rst.
> > +
> > +How to run the tests?
> > +~~~~~~~~~~~~~~~~~~~~~
> > +
> > +In order to facilitate running the test suite, a configuration file is present
> > +in ``drivers/gpu/drm/kunit/.kunitconfig``. It can be used by ``kunit.py`` as
> > +follows:
> > +
> > +.. code-block:: bash
> > +
> > +	$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/kunit \
> > +		--kconfig_add CONFIG_VIRTIO_UML=y \
> > +		--kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
> > +
> > +.. note::
> > +	The configuration included in ``.kunitconfig`` should be as generic as
> > +	possible.
> > +	``CONFIG_VIRTIO_UML`` and ``CONFIG_UML_PCI_OVER_VIRTIO`` are not
> > +	included in it because they are only required for User Mode Linux.
> > +
> > +
> 
> Maybe also add something like this ?
> 
> For example, the following command can be used to run the test for x86_64:
> 
> 	$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/kunit \
> 		--arch=x86_64

I didn't want to go into much detail because the KUnit docs are
a very good resource and already explain how to run the tests in your
favorite architecture.

Since running the test on x86_64 should not change the results, I'd
prefer to keep it simple and trust the KUnit docs for the "advanced"
options.
 
> Regardless, the patch looks good to me:
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>


Thanks a lot for taking the time to review it. I'll add the tag if a v4
is required after chatting with the guys working on the AMDGPU tests.

Jose

> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
> 
