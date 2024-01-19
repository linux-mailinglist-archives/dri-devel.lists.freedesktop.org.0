Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C0D832F62
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 20:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13DC10EA55;
	Fri, 19 Jan 2024 19:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4042E10E1FD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 19:33:56 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40e7e2e04f0so11849645e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 11:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1705692775; x=1706297575; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FwNauOvB6o9q6q3aBsg7Pq/WFusdyQcQo0tYXKHt6GQ=;
 b=Z2twtDIZxKVTL6TVVpxMd51JRo1IPSN1u/q4CZwBrBtwZunDJgxr8OmU6Ij27VOeJI
 E88Q3YFG7UG7YxFDij8oJUvm0Ja9pOYl3/GuKcTKJHfZkUDupm+fnynNsILXArEuIQMR
 Uls8TsdKGl7AXE8kAlALsphufhURXtJK0EyINHHnXFVAo6NQqAUMJOGAR+4wcNp/7eBO
 429rMux9V1VbwyEylFaQwcLrLXRzCrNq4sND/OpwmiCeVUPdDb58+YjgSfqDFCdq1K4W
 r0ikjNPI1uczHPm1KMBEZTeOjQXOyYrq7NYAFV3oWiO7QgIfwr6Sl2mhCV7ZOi/rGU6J
 SIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705692775; x=1706297575;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FwNauOvB6o9q6q3aBsg7Pq/WFusdyQcQo0tYXKHt6GQ=;
 b=E9MKAAzHtgH4NqhbechcKMHEn/wyRLaOAnCinn+RVYfFjXBdncwlW47qENSy99VZHk
 W2cQaZJqaQuTI6MR/nj3cEWEQsirY5jR1bypUVqf9Yf48T8WK3jUCBVV44JXUBhDOvJo
 sbmyRcSAsRU+0IYhGqq0z9SIijv/k6Pra48AVVVdGkPVHxWrNHaMDlrR6sl9Ogb6Pgpk
 V0/LDJwOYK0X1sQrsb+7QWBYGx8/H7ZqpHSlCKOTZiNqHkMF5E3hXACxsJeQEjGItfVj
 pjnBuh/mFdeDyTnAPOaHtxDet/l2ymS1j9S5jZdyknK/m5ZgqJG5mEzlDL+SaFzZVFeN
 HDhw==
X-Gm-Message-State: AOJu0YxQssqD50QYjCjwJZEy2Zhp5hFtgqUk65LCqgNBIqwsUuI8/ZOB
 ElwuysXcKEC7GfkQL97XatdkQkBdaw1X8Fdi4doKMYXQ1tv1CR/HNaebaPWYEFw=
X-Google-Smtp-Source: AGHT+IES4xFDyFEvaCgtPpSoHqtsHrVaMI/el0CSwVDqCQMTrqrO5Z5Rz4FwS6geBXm1gtfK5b+kiQ==
X-Received: by 2002:a05:600c:1990:b0:40e:a351:7076 with SMTP id
 t16-20020a05600c199000b0040ea3517076mr13618wmq.105.1705692774754; 
 Fri, 19 Jan 2024 11:32:54 -0800 (PST)
Received: from suse.de ([81.95.8.245]) by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c19cd00b0040e451fd602sm33825451wmq.33.2024.01.19.11.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 11:32:54 -0800 (PST)
Date: Fri, 19 Jan 2024 20:32:53 +0100
From: Stefan Dirsch <sndirsch@suse.com>
To: Matt Turner <mattst88@gmail.com>
Subject: Re: Mesa >= 23.3.x and python 2.6 ...
Message-ID: <20240119193253.ththa6dvqcz5gcth@suse.de>
References: <20240118123752.bl3qss3qbbxgvpdk@suse.de>
 <CAEdQ38GM63O2Y=1UR9wX0PTTGyZuZiT1NZyaVwSfnFuG8eoqFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEdQ38GM63O2Y=1UR9wX0PTTGyZuZiT1NZyaVwSfnFuG8eoqFw@mail.gmail.com>
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
Cc: mesa-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 19, 2024 at 12:35:58PM -0500, Matt Turner wrote:
> On Thu, Jan 18, 2024 at 10:22 AM Stefan Dirsch <sndirsch@suse.com> wrote:
> > I noticed that with version 23.3.x Mesa no longer can be built with python
> > 2.6. It still worked with Mesa 23.2.1.
> 
> For anyone who got this far and was completely incredulous... this
> (and the subject) is typo'd -- the problem is about Python 3.6, not
> 2.6.

I'm pretty sure you were the first and only one. :-( I've corrected it in the
body by doing a reply to my own message, but how do I correct a typo in the
subject ... I'll try to send the message again with also the correct
subject. Then I'll be blamed for bringing up the same topic twice and spamming
the list. Sigh.

Thanks for having a look at the message nevertheless!

Thanks,
Stefan

Public Key available
------------------------------------------------------
Stefan Dirsch (Res. & Dev.)   SUSE Software Solutions Germany GmbH
Tel: 0911-740 53 0            Frankenstraße 146
FAX: 0911-740 53 479          D-90461 Nürnberg
http://www.suse.de            Germany 
----------------------------------------------------------------
Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
(HRB 36809, AG Nürnberg)
----------------------------------------------------------------
