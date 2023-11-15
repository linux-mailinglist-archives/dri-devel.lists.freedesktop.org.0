Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8007ED779
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 23:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D420C10E00D;
	Wed, 15 Nov 2023 22:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E62F10E00D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 22:44:11 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7788f727dd7so7108885a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 14:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700088250; x=1700693050; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PnPNvgYVe/a3KXEsnvx4GNWysFw45MMaqeVr2951f4Q=;
 b=sdfCyecrmkWK2UeidH4cfJ+2eI7VD6VndDIs1DqMQNXThQbrQmsrrQVy/13kDk6WDA
 XGb0e+k82QHKq+Yy1U3Ehs9l57wdEVyD19Zfkpz5RG6bNlIsh2wuMGmdI8YTNBIXzTVN
 udd2XSDp1ElLuwGBjvd+QE650X4AdblwIOYp/F+AR8gqA3QuXVKuP3MARDTGvC6c4jPk
 Z+rCBePsIhM6d050weTcAa1KM7n9cU/oSfBSt6iwz0L3W03RqtCpZcXLU3bERDXbR2zi
 QMlVKYwjCxGA/veZMns7T6f265bv3drYPAZj+9UlYe+9VgQEAAJmB8ueV48sxl8IqeEa
 xEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700088250; x=1700693050;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PnPNvgYVe/a3KXEsnvx4GNWysFw45MMaqeVr2951f4Q=;
 b=ULQvZmXStMuhqRbTZz3KAGUf06+pQGebiuLnl12JfhCqpYHt50dxK3uyDak4EUsrIi
 A1uxJOPHiq5LTnZwfGj1MyFCZM3RsO5XJa0u6B1IC/C8nrcruwqk0CZ6/5Rc+wHIwkTk
 emMA5HL8tt+pn4NWdaIqAsgw2HV8qUJyVrnagWh5p2kUvvfZS5kHJjpGqSXbHHiZCzbq
 4mAVBpNU+fHwhKUoj79xqIqDIQLQa2ORafO8TnSg4Z1qy9Ax4ejoX5jxVW7/qiDAV6+F
 FO2nluaBitun3wv+Lpj0Qf6OqeACoHe8y2PV+EsdKbJaqFlWKQpjhQ5bItlN928U0Hrc
 26tQ==
X-Gm-Message-State: AOJu0YzQe/ToxZYCziVR5HmT8o9/B+ffpYwn0ckodqtr1f2Q3OBdBmwI
 p739IsALnzrSOgSLSDwa60TD/Q==
X-Google-Smtp-Source: AGHT+IEXDa9AqDk6k23ASNVZlgKVGyl4b96qGCZ+OOAUM0YbtOUy7P5HZ7bH5z4OmceD3xsVsN2MMQ==
X-Received: by 2002:a05:620a:480e:b0:77b:c47e:727f with SMTP id
 eb14-20020a05620a480e00b0077bc47e727fmr7898555qkb.28.1700088250234; 
 Wed, 15 Nov 2023 14:44:10 -0800 (PST)
Received: from localhost (ip-185-104-139-34.ptr.icomera.net. [185.104.139.34])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a05620a16b300b00772662b7804sm3815744qkj.100.2023.11.15.14.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 14:42:58 -0800 (PST)
Date: Wed, 15 Nov 2023 17:42:17 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: mripard@kernel.org
Subject: Re: [RFC] drm/tests: annotate intentional stack trace in
 drm_test_rect_calc_hscale()
Message-ID: <8489c4db-6639-43f5-b6c4-8598652cdce6@suswa.mountain>
References: <02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain>
 <CA+G9fYuA643RHHpPnz9Ww7rr3zV5a0y=7_uFcybBSL=QP_sQvQ@mail.gmail.com>
 <7b58926a-a7c3-4ad0-b8a3-56baf36939ca@kadam.mountain>
 <s4blvjs4ipcqdzodmgsbvgegqh2kxgdnoerpwthvc57hpsulu5@gb2kh7vbv7nq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s4blvjs4ipcqdzodmgsbvgegqh2kxgdnoerpwthvc57hpsulu5@gb2kh7vbv7nq>
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
Cc: Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
 Kees Cook <keescook@chromium.org>, kernel-janitors@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, kv-team <kv-team@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 06, 2023 at 02:58:12PM +0100, mripard@kernel.org wrote:
> > But a similar thing is happening here where we have so many bogus
> > warnings that we missed a real bug.
> 
> IIRC, there was a similar discussion for lockdep issues. IMO, any
> (unintended) warning should trigger a test failure.
> 
> I guess that would require adding some intrumentation to __WARN somehow,
> and also allowing tests to check whether a warning had been generated
> during their execution for tests that want to trigger one.

I think this is a good idea.  I was looking at how lockdep prints
warnings (see print_circular_bug_header()).  It doesn't use WARN() it
prints a bunch of pr_warn() statements and then a stack trace.  We would
have to have a increment the counter manually in that situation.

I'm writing a script to parse a dmesg and collect Oopses.  So now I know
to look for WARN(), lockdep, and KASAN.  What other bugs formats do we
have?  Probably someone like the syzbot devs have already has written a
script like this?

regards,
dan carpenter
