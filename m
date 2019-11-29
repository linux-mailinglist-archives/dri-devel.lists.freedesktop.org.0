Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3870710DDBA
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 14:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC336E11C;
	Sat, 30 Nov 2019 13:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20766E94C;
 Fri, 29 Nov 2019 21:00:01 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q6so490271lfb.6;
 Fri, 29 Nov 2019 13:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=73lCoPy2waKrGKmGeeI8t0QLjdkKSb0CKohb7acKBM8=;
 b=r9UoZXaXMeYlYIKxYd5GMQwvCUxnW6tawSujNZjO/6WKHj38uPRdP7nupFu2tvKfEU
 G4lFP0iv7QJ38H5lz9YRuSk7S5vtEI0Sze0xjmr9Z0Z6LBO5AXA2RptNhG3uEdzvYvgA
 bl3iB1ddYWmNx13j+vvkvgtTHYza2SXFTKGhoYqaZoa7Fno9MDZyFEEwpM55/LspTlnD
 ZCmn+aGl192rSTNyOiJ713C3joSsaIN5sjkcAWC0MZ9Z1qdEfBjuMs3UajKWop6LZ2qL
 tgA05e2GTdXcpTaZ1uRBXWA7rdZykoNVpOH3L6JrgDFej6StuE5P+MwvWMTccoSLdsJc
 u2cA==
X-Gm-Message-State: APjAAAVb/2sfTy+E1PlEufeFnd+tko1vKirG720UBV6XGigAKMhWcQ4g
 KncMrNYQyvr6aEskbfSIdAtcERUgoC6ikhzmvJg=
X-Google-Smtp-Source: APXvYqwo59Ax0LxrlcCnL8gVkxVWG8m5joqaeUL4vjb5tPre3qFXF3Ap1ytwvo+z0YkgdiaYHGMF2ih91kj8iJBpxJc=
X-Received: by 2002:a19:8a41:: with SMTP id m62mr3506171lfd.66.1575061200278; 
 Fri, 29 Nov 2019 13:00:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575022735.git.jani.nikula@intel.com>
 <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
 <20191129152424.GG624164@phenom.ffwll.local>
 <CANiq72kRGg1AZHC-pR_uKykMxmcMPM2+qbXVPVQhHrZRzu723Q@mail.gmail.com>
 <20191129203007.GV624164@phenom.ffwll.local>
In-Reply-To: <20191129203007.GV624164@phenom.ffwll.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Nov 2019 21:59:49 +0100
Message-ID: <CANiq72mEseWduUkJ069E8m8XKuyctsxOsTEZAfGm9d81WzpGEQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] auxdisplay: constify fb ops
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Sat, 30 Nov 2019 13:23:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=73lCoPy2waKrGKmGeeI8t0QLjdkKSb0CKohb7acKBM8=;
 b=S58ovFgFsWdSAL50dRla4S0sz3zQZVQMxZxqxpGlJzlOif+iyCfdHvjcc+Awy6qaiG
 iHXOx7QJfgHGMPBIHKryEMakgNWg/8K3iMkelofPg7XJi10vwwD+RtI3fvpDKC+FuEjI
 09okw9bM12OJV0UxJEHDQslOz7AV+7qhcVdEw6DOG8PldJfshb9+Nq/rdVzen+W+/n75
 4fPqzL9D5UPzSVwwT7MxC9/S+3AAnW8EurYMUml98yUdnX7IfMIjCXFa2gKehIoDwzjo
 fw5Z4RsTCp9227rqnj5IrdmTctpny9Fg70/gl6/Ygcq6/2KMnPe+motlf6OIuNrkPI1J
 8+fA==
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Robin van der Gracht <robin@protonic.nl>, linux-fbdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgOTozMCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gV2VsbCB3ZSBkbyBoYXZlIHZlcnkgc21hbGwgbGNkIGRpc3BsYXkg
ZHJpdmVycyBpbiBkcm0sIGFuZCBiZWZvcmUgdGhhdCBpbgo+IGZiZGV2LiBBbmQgeW91IGhhdmUg
YSBmYmRldiBmcmFtZWJ1ZmZlciBkcml2ZXIgaW4gdGhlcmUsIHdoaWNoIGxvb2tzIGEgYml0Cj4g
bWlzcGxhY2VkIC4uLgo+Cj4gQWZhaXVpIHlvdSBhbHNvIGhhdmUgc29tZSBldmVuIHRpbmllciBs
Y2QgZHJpdmVycyB3aGVyZSB5b3UgZG9uJ3QgYWRkcmVzcwo+IHBpeGVscywgYnV0IGp1c3QgZGly
ZWN0bHkgdXBsb2FkIHRleHQsIGFuZCB0aG9zZSBvYnZpb3VzbHkgZG9uJ3QgZml0IGludG8KPiBk
cm0vZmJkZXYgd29ybGQuIEJ1dCBhbnl0aGluZyB3aGVyZSB5b3UgY2FuIGFkZHJlc3MgcGl4ZWxz
IHZlcnkgbXVjaCBkb2VzLgo+IC1EYW5pZWwKClRoZSBmaXJzdCBkcml2ZXIgaW4gdGhlIGNhdGVn
b3J5IHVzZWQgZmIuaC4gQXQgdGhlIHRpbWUgKH4xMyB5ZWFycwphZ28pIGl0IHdhcyBkZWNpZGVk
IHRoYXQgdGhlIGRyaXZlcnMgc2hvdWxkIGdvIGludG8gYSBkaWZmZXJlbnQKY2F0ZWdvcnkvZm9s
ZGVyIGluc3RlYWQgYW5kIHRoZW4gdGhlIG90aGVyIHdlcmUgYWRkZWQuCgpJbiBhbnkgY2FzZSwg
SSBhbSByZW1vdmluZyB0aGUgb3JpZ2luYWwgb25lcyBzaW5jZSBJIGNhbm5vdCB0ZXN0IHRoZW0K
YW55bW9yZSBhbmQgdGhlcmUgYXJlIGxpa2VseSBubyB1c2VyLiBUaGUgb25seSBvdGhlciBmYiB1
c2VyIGNvdWxkIGJlCnJlbG9jYXRlZCBpZiBSb2JpbiBhZ3JlZXMuCgpDaGVlcnMsCk1pZ3VlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
