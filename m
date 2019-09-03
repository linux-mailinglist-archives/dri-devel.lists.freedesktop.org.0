Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53329A632C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 09:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C55896EC;
	Tue,  3 Sep 2019 07:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD4F896EB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 07:55:54 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id o9so6047048edq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 00:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=AmAnl8kfE0vBI96hdeUKYAwDGENm90ZrAc9j932dkWk=;
 b=hoDCB17wRP9RSEEDKEa7CprConhdtezx1cBpjQlxv9m2t6TZKHCqTLBCnz+kvkrP1V
 /nhJD4FIVP6y1dPVOSHEJ5GO5+vDN9DStoZJ+YSpGigoHOdiDOc5Pg/DpyEBAeV+6LYv
 BqUgbl/a1G4RJY1vFO65fzcO9eQe2vVLCq6px/s8rTnswOUOn9tmU6UKhn/6G5UUH0Uf
 z+vLHtm2UmBgWIIzrAZL15zUpl2Up75aTlamJd9HosM/yxJXlGqpFjpe7PW99Y2KCRAI
 uwEWVljbPpGV4GL28aNgnKxI80GyeU/pClafro06/ZjuIQmpvHo7OroQzPC6t8DyXGDx
 8Uxw==
X-Gm-Message-State: APjAAAV3xLs1Zafip4gpEUV/48RLzwSkOul37odC+6j9ICjdL2YyK9xF
 fO4dGCewgSrUpfbfEUzg0TOszA==
X-Google-Smtp-Source: APXvYqy9u46WjLxxF2M4g4BWzlWEqsYbrIpLaHO40gsB5L5SjPuxVBEmsEciOorZrj9TrV4x1gUNZA==
X-Received: by 2002:a50:d903:: with SMTP id t3mr6724598edj.117.1567497353465; 
 Tue, 03 Sep 2019 00:55:53 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id q10sm2251744ejt.54.2019.09.03.00.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 00:55:52 -0700 (PDT)
Date: Tue, 3 Sep 2019 09:55:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
Message-ID: <20190903075550.GJ2112@phenom.ffwll.local>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190831042857.GD2263813@devbig004.ftw2.facebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190831042857.GD2263813@devbig004.ftw2.facebook.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AmAnl8kfE0vBI96hdeUKYAwDGENm90ZrAc9j932dkWk=;
 b=iQMmbEKgIKuMneIbsrUBAZYlU4Mg+FeMtANYlS6Dl5ifcZg4VGyCjb1JFiQUT7btFd
 nYpM3eu6ZkxFgg+n/Io7Jn5hT5uw31/DUBhLS6ruwdTHq4AT7kihHaG/r2X3RyMstpb3
 adstYR0gjOB+q20iq8zQ+/I9/Ai1x9sYhh6Kg=
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, felix.kuehling@amd.com, jsparks@cray.com,
 amd-gfx@lists.freedesktop.org, lkaplan@cray.com, y2kenny@gmail.com,
 dri-devel@lists.freedesktop.org, joseph.greathouse@amd.com,
 alexander.deucher@amd.com, cgroups@vger.kernel.org, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMDk6Mjg6NTdQTSAtMDcwMCwgVGVqdW4gSGVvIHdyb3Rl
Ogo+IEhlbGxvLAo+IAo+IEkganVzdCBnbGFuY2VkIHRocm91Z2ggdGhlIGludGVyZmFjZSBhbmQg
ZG9uJ3QgaGF2ZSBlbm91Z2ggY29udGV4dCB0bwo+IGdpdmUgYW55IGtpbmQgb2YgZGV0YWlsZWQg
cmV2aWV3IHlldC4gIEknbGwgdHJ5IHRvIHJlYWQgdXAgYW5kCj4gdW5kZXJzdGFuZCBtb3JlIGFu
ZCB3b3VsZCBncmVhdGx5IGFwcHJlY2lhdGUgaWYgeW91IGNhbiBnaXZlIG1lIHNvbWUKPiBwb2lu
dGVycyB0byByZWFkIHVwIG9uIHRoZSByZXNvdXJjZXMgYmVpbmcgY29udHJvbGxlZCBhbmQgaG93
IHRoZQo+IGFjdHVhbCB1c2UgY2FzZXMgd291bGQgbG9vayBsaWtlLiAgVGhhdCBzYWlkLCBJIGhh
dmUgc29tZSBiYXNpYwo+IGNvbmNlcm5zLgo+IAo+ICogVFRNIHZzLiBHRU0gZGlzdGluY3Rpb24g
c2VlbXMgdG8gYmUgaW50ZXJuYWwgaW1wbGVtZW50YXRpb24gZGV0YWlsCj4gICByYXRoZXIgdGhh
biBhbnl0aGluZyByZWxhdGluZyB0byB1bmRlcmx5aW5nIHBoeXNpY2FsIHJlc291cmNlcy4KPiAg
IFByb3ZpZGVkIHRoYXQncyB0aGUgY2FzZSwgSSdtIGFmcmFpZCB0aGVzZSBpbnRlcm5hbCBjb25z
dHJ1Y3RzIGJlaW5nCj4gICB1c2VkIGFzIHByaW1hcnkgcmVzb3VyY2UgY29udHJvbCBvYmplY3Rz
IGxpa2VseSBpc24ndCB0aGUgcmlnaHQKPiAgIGFwcHJvYWNoLiAgV2hldGhlciBhIGdpdmVuIGRy
aXZlciB1c2VzIG9uZSBvciB0aGUgb3RoZXIgaW50ZXJuYWwKPiAgIGFic3RyYWN0aW9uIGxheWVy
IHNob3VsZG4ndCBkZXRlcm1pbmUgaG93IHJlc291cmNlcyBhcmUgcmVwcmVzZW50ZWQKPiAgIGF0
IHRoZSB1c2VybGFuZCBpbnRlcmZhY2UgbGF5ZXIuCgpZZWFoIHRoZXJlJ3MgYW5vdGhlciBSRkMg
c2VyaWVzIGZyb20gQnJpYW4gV2VsdHkgdG8gYWJzdHJhY3QgdGhpcyBhd2F5IGFzCmEgbWVtb3J5
IHJlZ2lvbiBjb25jZXB0IGZvciBncHVzLgoKPiAqIFdoaWxlIGJyZWFraW5nIHVwIGFuZCBhcHBs
eWluZyBjb250cm9sIHRvIGRpZmZlcmVudCB0eXBlcyBvZgo+ICAgaW50ZXJuYWwgb2JqZWN0cyBt
YXkgc2VlbSBhdHRyYWN0aXZlIHRvIGZvbGtzIHdobyB3b3JrIGRheSBpbiBhbmQKPiAgIGRheSBv
dXQgd2l0aCB0aGUgc3Vic3lzdGVtLCB0aGV5IGFyZW4ndCBhbGwgdGhhdCB1c2VmdWwgdG8gdXNl
cnMgYW5kCj4gICB0aGUgc2lsb2VkIGNvbnRyb2xzIGFyZSBsaWtlbHkgdG8gbWFrZSB0aGUgd2hv
bGUgbWVjaGFuaXNtIGEgbG90Cj4gICBsZXNzIHVzZWZ1bC4gIFdlIGhhZCB0aGUgc2FtZSBwcm9i
bGVtIHdpdGggY2dyb3VwMSBtZW1jZyAtIHB1dHRpbmcKPiAgIGNvbnRyb2wgb2YgZGlmZmVyZW50
IHVzZXMgb2YgbWVtb3J5IHVuZGVyIHNlcGFyYXRlIGtub2JzLiAgSXQgbWFkZQo+ICAgdGhlIHdo
b2xlIHRoaW5nIHByZXR0eSB1c2VsZXNzLiAgZS5nLiBpZiB5b3UgY29uc3RyYWluIGFsbCBrbm9i
cwo+ICAgdGlnaHQgZW5vdWdoIHRvIGNvbnRyb2wgdGhlIG92ZXJhbGwgdXNhZ2UsIG92ZXJhbGwg
dXRpbGl6YXRpb24KPiAgIHN1ZmZlcnMsIGJ1dCBpZiB5b3UgZG9uJ3QsIHlvdSByZWFsbHkgZG9u
J3QgaGF2ZSBjb250cm9sIG92ZXIgYWN0dWFsCj4gICB1c2FnZS4gIEZvciBtZW1jZywgd2hhdCBo
YXMgdG8gYmUgYWxsb2NhdGVkIGFuZCBjb250cm9sbGVkIGlzCj4gICBwaHlzaWNhbCBtZW1vcnks
IG5vIG1hdHRlciBob3cgdGhleSdyZSB1c2VkLiAgSXQncyBub3QgbGlrZSB5b3UgY2FuCj4gICBn
byBidXkgbW9yZSAic29ja2V0IiBtZW1vcnkuICBBdCBsZWFzdCBmcm9tIHRoZSBsb29rcyBvZiBp
dCwgSSdtCj4gICBhZnJhaWQgZ3B1IGNvbnRyb2xsZXIgaXMgcmVwZWF0aW5nIHRoZSBzYW1lIG1p
c3Rha2VzLgoKV2UgZG8gaGF2ZSBxdWl0ZSBhIHBpbGUgb2YgZGlmZmVyZW50IG1lbW9yaWVzIGFu
ZCByYW5nZXMsIHNvIEkgZG9uJ3QKdGhpbmt0IHdlJ3JlIGRvaW5nIHRoZSBzYW1lIG1pc3Rha2Ug
aGVyZS4gQnV0IGl0IGlzIG1heWJlIGEgYml0IHRvbwpjb21wbGljYXRlZCwgYW5kIGV4cG9zZXMg
c3R1ZmYgdGhhdCBtb3N0IHVzZXJzIHJlYWxseSBkb24ndCBjYXJlIGFib3V0LgotRGFuaWVsCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
