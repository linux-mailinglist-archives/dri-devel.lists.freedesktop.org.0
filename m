Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DBFA423A
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2019 06:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BB96E287;
	Sat, 31 Aug 2019 04:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768446E15E;
 Sat, 31 Aug 2019 04:29:02 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id b11so9961653qtp.10;
 Fri, 30 Aug 2019 21:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=lwpweyXTk6HuzAJ3GT4M5AgAi7POAAcap2BBTFJnQKA=;
 b=nHYqPd16pBdHf8U4tf9YBLUKnDkL2u/S0jvg0/P22+eR2WGG+3xCTaEQO8Yc9VfI90
 4UyvIwOe9EHr1uujdUPjmJ6ikghTo0yEWhs1BV974smHsiwLQ3CxKLweb784JGoeCx7F
 5/7of7gxrfqqwwA7XgoPAGGLnjxSTAZxQBnqe8OpR+A2CqCabwi2ATAO8p0rspeNtWil
 ObI0YRjjpuJs+4pabrXtSMW5w0PK7r0rhD+w+tCWlZNn0MMM8Vx5WepC2f/ZAUn8z5o8
 kmhUyRTD5Cz90AA+iLGCqTNgpXz7i1YlT3/KjA2J0krAb+Eyh/KKh8v6d6rZ+XVJbcOJ
 aR2A==
X-Gm-Message-State: APjAAAXCib9A6iGuI2Uo+48JP0r67F32TOpc6mFg+qoC6haTrAhYUFcV
 AMC0fshDZvILw7UJI5hHveU=
X-Google-Smtp-Source: APXvYqwv/d6bQT0uOGUplb1qCVSd9gQ0DTwUq6yaI6aQuWJmq4AEjRK6Y1RNpwGnJxVqcbfL6aE46g==
X-Received: by 2002:ac8:4787:: with SMTP id k7mr1124028qtq.58.1567225741341;
 Fri, 30 Aug 2019 21:29:01 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::ca48])
 by smtp.gmail.com with ESMTPSA id n42sm2428453qta.31.2019.08.30.21.29.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Aug 2019 21:29:00 -0700 (PDT)
Date: Fri, 30 Aug 2019 21:28:57 -0700
From: Tejun Heo <tj@kernel.org>
To: Kenny Ho <Kenny.Ho@amd.com>
Subject: Re: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
Message-ID: <20190831042857.GD2263813@devbig004.ftw2.facebook.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829060533.32315-1-Kenny.Ho@amd.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lwpweyXTk6HuzAJ3GT4M5AgAi7POAAcap2BBTFJnQKA=;
 b=s4i3FNlgFD8ikcxdRUW9iyjInekAGuqySbkYtiCnZrBoM3n2abUChr3xu+YjPn2UeP
 SykfSiquLyhfi4A+zVQ2kCRJTq+IgIsFjM5GSUM5Sgo8S45OxRn7UELBp6qLZDXLrKMn
 ZQtWrhyq3fxz+vXbqeM/+Hs28Tuc/D29ObEUpXcmZnWndxLG/1GuZRu6CwqZsptwnHHn
 Pr8PW0QYlJb94sObK59mwoJtxuPv+SQIqU1el8UP3Kq9iufrR/lJ/UsSYecnh2+0lAFr
 hKpdpidNq70c3DVm2Lhkb8f426HKWIuUw82lnc7/7wWniCdtaCaw4HsxXqRDnAXs8q18
 uDDA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: felix.kuehling@amd.com, jsparks@cray.com, amd-gfx@lists.freedesktop.org,
 lkaplan@cray.com, y2kenny@gmail.com, dri-devel@lists.freedesktop.org,
 joseph.greathouse@amd.com, alexander.deucher@amd.com, cgroups@vger.kernel.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpJIGp1c3QgZ2xhbmNlZCB0aHJvdWdoIHRoZSBpbnRlcmZhY2UgYW5kIGRvbid0IGhh
dmUgZW5vdWdoIGNvbnRleHQgdG8KZ2l2ZSBhbnkga2luZCBvZiBkZXRhaWxlZCByZXZpZXcgeWV0
LiAgSSdsbCB0cnkgdG8gcmVhZCB1cCBhbmQKdW5kZXJzdGFuZCBtb3JlIGFuZCB3b3VsZCBncmVh
dGx5IGFwcHJlY2lhdGUgaWYgeW91IGNhbiBnaXZlIG1lIHNvbWUKcG9pbnRlcnMgdG8gcmVhZCB1
cCBvbiB0aGUgcmVzb3VyY2VzIGJlaW5nIGNvbnRyb2xsZWQgYW5kIGhvdyB0aGUKYWN0dWFsIHVz
ZSBjYXNlcyB3b3VsZCBsb29rIGxpa2UuICBUaGF0IHNhaWQsIEkgaGF2ZSBzb21lIGJhc2ljCmNv
bmNlcm5zLgoKKiBUVE0gdnMuIEdFTSBkaXN0aW5jdGlvbiBzZWVtcyB0byBiZSBpbnRlcm5hbCBp
bXBsZW1lbnRhdGlvbiBkZXRhaWwKICByYXRoZXIgdGhhbiBhbnl0aGluZyByZWxhdGluZyB0byB1
bmRlcmx5aW5nIHBoeXNpY2FsIHJlc291cmNlcy4KICBQcm92aWRlZCB0aGF0J3MgdGhlIGNhc2Us
IEknbSBhZnJhaWQgdGhlc2UgaW50ZXJuYWwgY29uc3RydWN0cyBiZWluZwogIHVzZWQgYXMgcHJp
bWFyeSByZXNvdXJjZSBjb250cm9sIG9iamVjdHMgbGlrZWx5IGlzbid0IHRoZSByaWdodAogIGFw
cHJvYWNoLiAgV2hldGhlciBhIGdpdmVuIGRyaXZlciB1c2VzIG9uZSBvciB0aGUgb3RoZXIgaW50
ZXJuYWwKICBhYnN0cmFjdGlvbiBsYXllciBzaG91bGRuJ3QgZGV0ZXJtaW5lIGhvdyByZXNvdXJj
ZXMgYXJlIHJlcHJlc2VudGVkCiAgYXQgdGhlIHVzZXJsYW5kIGludGVyZmFjZSBsYXllci4KCiog
V2hpbGUgYnJlYWtpbmcgdXAgYW5kIGFwcGx5aW5nIGNvbnRyb2wgdG8gZGlmZmVyZW50IHR5cGVz
IG9mCiAgaW50ZXJuYWwgb2JqZWN0cyBtYXkgc2VlbSBhdHRyYWN0aXZlIHRvIGZvbGtzIHdobyB3
b3JrIGRheSBpbiBhbmQKICBkYXkgb3V0IHdpdGggdGhlIHN1YnN5c3RlbSwgdGhleSBhcmVuJ3Qg
YWxsIHRoYXQgdXNlZnVsIHRvIHVzZXJzIGFuZAogIHRoZSBzaWxvZWQgY29udHJvbHMgYXJlIGxp
a2VseSB0byBtYWtlIHRoZSB3aG9sZSBtZWNoYW5pc20gYSBsb3QKICBsZXNzIHVzZWZ1bC4gIFdl
IGhhZCB0aGUgc2FtZSBwcm9ibGVtIHdpdGggY2dyb3VwMSBtZW1jZyAtIHB1dHRpbmcKICBjb250
cm9sIG9mIGRpZmZlcmVudCB1c2VzIG9mIG1lbW9yeSB1bmRlciBzZXBhcmF0ZSBrbm9icy4gIEl0
IG1hZGUKICB0aGUgd2hvbGUgdGhpbmcgcHJldHR5IHVzZWxlc3MuICBlLmcuIGlmIHlvdSBjb25z
dHJhaW4gYWxsIGtub2JzCiAgdGlnaHQgZW5vdWdoIHRvIGNvbnRyb2wgdGhlIG92ZXJhbGwgdXNh
Z2UsIG92ZXJhbGwgdXRpbGl6YXRpb24KICBzdWZmZXJzLCBidXQgaWYgeW91IGRvbid0LCB5b3Ug
cmVhbGx5IGRvbid0IGhhdmUgY29udHJvbCBvdmVyIGFjdHVhbAogIHVzYWdlLiAgRm9yIG1lbWNn
LCB3aGF0IGhhcyB0byBiZSBhbGxvY2F0ZWQgYW5kIGNvbnRyb2xsZWQgaXMKICBwaHlzaWNhbCBt
ZW1vcnksIG5vIG1hdHRlciBob3cgdGhleSdyZSB1c2VkLiAgSXQncyBub3QgbGlrZSB5b3UgY2Fu
CiAgZ28gYnV5IG1vcmUgInNvY2tldCIgbWVtb3J5LiAgQXQgbGVhc3QgZnJvbSB0aGUgbG9va3Mg
b2YgaXQsIEknbQogIGFmcmFpZCBncHUgY29udHJvbGxlciBpcyByZXBlYXRpbmcgdGhlIHNhbWUg
bWlzdGFrZXMuCgpUaGFua3MuCgotLSAKdGVqdW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
