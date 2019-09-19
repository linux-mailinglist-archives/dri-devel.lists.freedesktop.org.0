Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 596BAB8C07
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50E36F8CE;
	Fri, 20 Sep 2019 07:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93346F499;
 Thu, 19 Sep 2019 14:28:34 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id b2so3228650otq.10;
 Thu, 19 Sep 2019 07:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QgW2uxCVtaKbF7TbtCGjgw8sygkrT37j0scFhp7VikQ=;
 b=M4DhoTTqZJ/yYVrAqYvjOLwPDq//4CzO9ESnn0XhT7pYWIt9EeWF2IgWtvIBon4TZx
 8EZyTEfR10ec9gw/0NDCY5qUS4VHW+JgOyt6Usmm4uivB2kbV/2LS8C9gWVlRXNShUxZ
 sxjm/hqZLuK5NrI+vhQ1pS3Rt89cHyDTTOscHDt6b3IVi/Ed0RIlwW3IHGsnhPpeadpf
 M0yO127MgWqCcs8TTBakUbGz/LqdTk6D1rKH3UnKPBupWjWiRZMoOmm//NRRP18yzgr2
 uQi+4B02T0el/FZFNYuVTJGi/5ToXX1IxuVcEpt+hbdlJsKukra7KMlHp10iRop0CO3P
 VjkQ==
X-Gm-Message-State: APjAAAUp1X9wTwR3CqNJptQWuAaPV6gPVSCWe/Kn+yVuG2iHuyakUJzG
 XkNO8IR+1QmX3L4ieujPMoVG+kriGC/+ZGpRL3s=
X-Google-Smtp-Source: APXvYqx7iOsTDyTC5MOoGe4i38azW0PdixKT3lxKfQTK2hHQYfSpvB84CcTf07+u7MbM/xsPCPUEfFKnSbF07BopLkc=
X-Received: by 2002:a9d:562:: with SMTP id 89mr7354793otw.232.1568903313740;
 Thu, 19 Sep 2019 07:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <7bab24ff-ded7-9f76-ba25-efd07cdd30dd@amd.com>
 <20190918190529.17298-1-navid.emamdoost@gmail.com>
 <88fc639a-32ed-b6c6-f930-552083d5887d@amd.com>
In-Reply-To: <88fc639a-32ed-b6c6-f930-552083d5887d@amd.com>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Thu, 19 Sep 2019 10:28:22 -0400
Message-ID: <CAGngYiWHe1mw0+Ay6HO7kG5y8HMriUX3BO8VUcTvGayEK-4JOw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: fix multiple memory leaks
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QgW2uxCVtaKbF7TbtCGjgw8sygkrT37j0scFhp7VikQ=;
 b=YV8wtytyUcDiMlRw0PwjWtAkaedjNlzX7apKcI4e5g1zDxCjzsX15aAafl5eVAgN5b
 wsomzSUtSlT0+n8KSapRMDX8X+c9btPtAzwA/r8SZvUsoRGUWUBouf7re8WCXVgcrN7t
 7/vBZKlwlI9aQxycGUBGmMaichRriBAciC0yae3aZviR5eIRnmJRUmZS7PkKROPjEXn9
 ZD7mOzxESg2P8dgk0fcBnzxGXbUUhbvs0818cVrYkQl+1Mr3HFyPmlxMAsuDIs50w27t
 G0mExnSsmmrPs7to+eF1TZhMScUo3K1tUx6maP+5isROBNP05Ne+wtVlOhWJVHp7/cD7
 MGyQ==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 "kjlu@umn.edu" <kjlu@umn.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "emamd001@umn.edu" <emamd001@umn.edu>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "smccaman@umn.edu" <smccaman@umn.edu>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKT24gVGh1LCBTZXAgMTksIDIwMTkgYXQgNDowNSBBTSBLb2VuaWcsIENo
cmlzdGlhbgo8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+ID4gK291dDQ6Cj4g
PiArICAgICBrZnJlZShpMnNfcGRhdGEpOwo+ID4gK291dDM6Cj4gPiArICAgICBrZnJlZShhZGV2
LT5hY3AuYWNwX3Jlcyk7Cj4gPiArb3V0MjoKPiA+ICsgICAgIGtmcmVlKGFkZXYtPmFjcC5hY3Bf
Y2VsbCk7Cj4gPiArb3V0MToKPiA+ICsgICAgIGtmcmVlKGFkZXYtPmFjcC5hY3BfZ2VucGQpOwo+
Cj4ga2ZyZWUgb24gYSBOVUxMIHBvaW50ZXIgaXMgaGFybWxlc3MsIHNvIGEgc2luZ2xlIGVycm9y
IGxhYmVsIHNob3VsZCBiZQo+IHN1ZmZpY2llbnQuCgpUaGF0IGlzIHRydWUsIGJ1dCBJIG5vdGlj
ZSB0aGF0IHRoZSBhZGV2IHN0cnVjdHVyZSBjb21lcyBmcm9tIG91dHNpZGUgdGhpcwpkcml2ZXI6
CgpzdGF0aWMgaW50IGFjcF9od19pbml0KHZvaWQgKmhhbmRsZSkKewouLi4Kc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7Ci4uLgp9CgpB
cyBmYXIgYXMgSSBjYW4gdGVsbCwgdGhlIGluaXQoKSBkb2VzIG5vdCBleHBsaWNpdGx5IHNldCB0
aGVzZSB0byBOVUxMOgphZGV2LT5hY3AuYWNwX3JlcwphZGV2LT5hY3AuYWNwX2NlbGwKYWRldi0+
YWNwLmFjcF9nZW5wZAoKSSBhbSBhc3N1bWluZyB0aGF0IGNvcmUgY29kZSBzZXRzIHRoZXNlIHRv
IE5VTEwsIGJlZm9yZSBjYWxsaW5nCmFjcF9od19pbml0KCkuIEJ1dCBpcyB0aGF0IGd1YXJhbnRl
ZWQgb3Igc2ltcGx5IGEgaGFwcHkgYWNjaWRlbnQ/CkllLiBpZiB0aGV5IGFyZSBOVUxMIHRvZGF5
LCBhcmUgdGhleSBsaWtlbHkgdG8gcmVtYWluIE5VTEwgdG9tb3Jyb3c/CgpCZWNhdXNlIGNhbGxp
bmcga2ZyZWUoKSBvbiBhIHN0YWxlIHBvaW50ZXIgd291bGQgYmUsIHdlbGwKbm90IGdvb2QuIEVz
cGVjaWFsbHkgbm90IG9uIGFuIGVycm9yIHBhdGgsIHdoaWNoIHR5cGljYWxseQpkb2VzIG5vdCBy
ZWNlaXZlIG11Y2ggdGVzdGluZywgaWYgYW55LgoKTXkgYXBvbG9naWVzIGlmIEkgaGF2ZSBtaXNp
bnRlcnByZXRlZCB0aGlzLCBJIGFtIG5vdCBmYW1pbGlhciB3aXRoCnRoaXMgY29kZSBiYXNlLgoK
U3ZlbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
