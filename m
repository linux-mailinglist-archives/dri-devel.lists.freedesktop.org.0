Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9707A6E81
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E130F10E406;
	Tue, 19 Sep 2023 22:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0835110E406
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:16:11 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-34f1ffda46fso41325ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 15:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695161771; x=1695766571;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qx6X0xE/S4amLJCM7NtzEUWnlj33ZBkwhJLGl58E30c=;
 b=3SDAxMWs9EPDQopzJshQvmzSlc7w4Bug1AJqR4rVjOt09p2BoVlAqqoqKPbbOshE9w
 zHTlERaL9y7yOpIo4d9juvm05RdyhaaXUZ6UkmzT7IK2vySYAcqv0aD9iyQ+NgZG+9XE
 2rb0vO3OcVzD6A1xH/hBa6UHzKl7S3tYMrnlqBB8xR/XpmGn009A8JSrGsN6gnQIiSSp
 Kz9Op3+mU02b1gsV8lKSb0pGXb8UeAqCFcvejPpCEw+Ij4+pqakrO8Trg31UbU4J+1wi
 LkpDJecMNFJJjiKp/da7IEVQxwFPLorQ5dhVTTGwmngFK4HtDJ2qlRE38L2t8W2GLIdN
 3Row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695161771; x=1695766571;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qx6X0xE/S4amLJCM7NtzEUWnlj33ZBkwhJLGl58E30c=;
 b=F5jR3wzQ6YIUG41AbX6lajC0MdkONTqBNF2uUNz5Nj+ogcK9o6zc9Ajul5DGdxVrnW
 7218M11wvhReR9V1g/nJser7wm5yPd7JzBCvdPjeMMqSQmi6j/cGFKUiG+SUtuacYCGG
 czswLEP7X7F3svGKy8D9r9Ho3qf+ydbxX6jGsYVZlfeWc8VCVB+97XTKz/EaFVFyiFnj
 mRL42+pHlHh07vmQbZECg8Zb7g24oMRRSwrlsQL1XKa4pNcB5eSl2KqfYZI0E0aP2d+8
 gF5+sD0dKC1AOlJ4tQGuBxjg56w1SdiIimuXqlu+dKkCzq7wABBXGnyoX9nLkqnBNUX+
 8EOA==
X-Gm-Message-State: AOJu0YzzHQ6u1JqYOLwsU5+Y8HlWhmBuSs0+hPllnxX/6Hqb1U08OB4O
 AxhrzS5Xl4aoSC5W04Bjh8AeFDRy0bdlCAT8Slw5
X-Google-Smtp-Source: AGHT+IFu656+dV482iOm4cZxrrexPRdD0DlnR8zGkINMB46WE10oFo6V8aYZJV2oIbzlETIcCyiXYFcp0DlRO0Dyrxg=
X-Received: by 2002:a05:6e02:b21:b0:34f:ec9f:dd75 with SMTP id
 e1-20020a056e020b2100b0034fec9fdd75mr90136ilu.28.1695161770968; Tue, 19 Sep
 2023 15:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-9-yong.wu@mediatek.com>
 <20230911154448.GA1279317-robh@kernel.org>
 <c2f1df12cc2dc25b342029e49c6d3f120d380b47.camel@mediatek.com>
 <c62a7ed8-d80a-3a82-040a-d4c74a71285a@linaro.org>
 <95f9dd3b-1f33-4af5-8757-a97e8b9bb216@arm.com>
 <20230912155338.GA842444-robh@kernel.org>
 <a63ab61fbf4d2bdadeb68441050ff5187c93ba96.camel@mediatek.com>
In-Reply-To: <a63ab61fbf4d2bdadeb68441050ff5187c93ba96.camel@mediatek.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Tue, 19 Sep 2023 15:15:59 -0700
Message-ID: <CA+ddPcPFFpDA2qtxMg6BNztsXi3mVFRghBwe6556mAL54jB06g@mail.gmail.com>
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "krzysztof.kozlow.ski+dt@linaro.org" <krzysztof.kozlow.ski+dt@linaro.org>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 18, 2023 at 3:47=E2=80=AFAM Yong Wu (=E5=90=B4=E5=8B=87) <Yong.=
Wu@mediatek.com> wrote:
>
> On Tue, 2023-09-12 at 10:53 -0500, Rob Herring wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Tue, Sep 12, 2023 at 11:13:50AM +0100, Robin Murphy wrote:
> > > On 12/09/2023 9:28 am, Krzysztof Kozlowski wrote:
> > > > On 12/09/2023 08:16, Yong Wu (=E5=90=B4=E5=8B=87) wrote:
> > > > > Hi Rob,
> > > > >
> > > > > Thanks for your review.
> > > > >
> > > > > On Mon, 2023-09-11 at 10:44 -0500, Rob Herring wrote:
> > > > > >
> > > > > > External email : Please do not click links or open
> > attachments until
> > > > > > you have verified the sender or the content.
> > > > > >   On Mon, Sep 11, 2023 at 10:30:37AM +0800, Yong Wu wrote:
> > > > > > > This adds the binding for describing a CMA memory for
> > MediaTek
> > > > > > SVP(Secure
> > > > > > > Video Path).
> > > > > >
> > > > > > CMA is a Linux thing. How is this related to CMA?
> > > > >
> > > > > > >
> > > > > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > > > > ---
> > > > > > >   .../mediatek,secure_cma_chunkmem.yaml         | 42
> > > > > > +++++++++++++++++++
> > > > > > >   1 file changed, 42 insertions(+)
> > > > > > >   create mode 100644
> > Documentation/devicetree/bindings/reserved-
> > > > > > memory/mediatek,secure_cma_chunkmem.yaml
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/reserved-
> > > > > > memory/mediatek,secure_cma_chunkmem.yaml
> > > > > > b/Documentation/devicetree/bindings/reserved-
> > > > > > memory/mediatek,secure_cma_chunkmem.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..cc10e00d35c4
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/reserved-
> > > > > > memory/mediatek,secure_cma_chunkmem.yaml
> > > > > > > @@ -0,0 +1,42 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id:
> > > > > >
> > http://devicetree.org/schemas/reserved-memory/mediatek,secure_cma_chunk=
mem.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: MediaTek Secure Video Path Reserved Memory
> > > > > >
> > > > > > What makes this specific to Mediatek? Secure video path is
> > fairly
> > > > > > common, right?
> > > > >
> > > > > Here we just reserve a buffer and would like to create a dma-
> > buf secure
> > > > > heap for SVP, then the secure engines(Vcodec and DRM) could
> > prepare
> > > > > secure buffer through it.
> > > > > But the heap driver is pure SW driver, it is not platform
> > device and
> > > >
> > > > All drivers are pure SW.
> > > >
> > > > > we don't have a corresponding HW unit for it. Thus I don't
> > think I
> > > > > could create a platform dtsi node and use "memory-region"
> > pointer to
> > > > > the region. I used RESERVEDMEM_OF_DECLARE currently(The code is
> > in
> > > > > [9/9]). Sorry if this is not right.
> > > >
> > > > If this is not for any hardware and you already understand this
> > (since
> > > > you cannot use other bindings) then you cannot have custom
> > bindings for
> > > > it either.
> > > >
> > > > >
> > > > > Then in our usage case, is there some similar method to do
> > this? or
> > > > > any other suggestion?
> > > >
> > > > Don't stuff software into DTS.
> > >
> > > Aren't most reserved-memory bindings just software policy if you
> > look at it
> > > that way, though? IIUC this is a pool of memory that is visible and
> > > available to the Non-Secure OS, but is fundamentally owned by the
> > Secure
> > > TEE, and pages that the TEE allocates from it will become
> > physically
> > > inaccessible to the OS. Thus the platform does impose constraints
> > on how the
> > > Non-Secure OS may use it, and per the rest of the reserved-memory
> > bindings,
> > > describing it as a "reusable" reservation seems entirely
> > appropriate. If
> > > anything that's *more* platform-related and so DT-relevant than
> > typical
> > > arbitrary reservations which just represent "save some memory to
> > dedicate to
> > > a particular driver" and don't actually bear any relationship to
> > firmware or
> > > hardware at all.
> >
> > Yes, a memory range defined by hardware or firmware is within scope
> > of
> > DT. (CMA at aribitrary address was questionable.)
>

Before I reply, my context is that I'm using these patches from
Mediatek on ChromeOS to implement secure video playback.

> I guess the memory range is not "defined" by HW in our case, but this
> reserve buffer is indeed prepared for and used by HW.
>
The memory range is defined in the firmware. The TEE is configured
with the same address/size that is being set in this DT node. (so
based on comments already, this is appropriate to put in the DT).

> If this is a normal reserved buffer for some device, we could define a
> reserved-memory with "shared-dma-pool", then the device use it via
> "memory-region" property, is this right?
>
> Here it is a secure buffer case and this usage relationship is
> indirect. We create a new heap for this new secure type memory, other
> users such as VCODEC and DRM allocate secure memory through the new
> heap.
>
> About the aribitrary address is because we have HW register for it. As
> long as this is a legal dram address, it is fine. When this address is
> passed into TEE, it will be protected by HW.
>
> >
> > My issue here is more that 'secure video memory' is not any way
> > Mediatek
> > specific.
>
> Sorry, I don't know if there already is an SVP case in the current
> kernel. If so, could you help share it?

I don't think there is any SVP (Secure Video Path) case in the current
kernel. I agree this shouldn't be a Mediatek specific setting, as this
could be usable to other SVP implementations.

I do think this should have 'cma' in the DT description, as it does
relate to what the driver is going to do with this memory region. It
will establish it as a CMA region in Linux. The reason it needs to be
a CMA region is that the entire memory region will need to transition
between secure (i.e. TEE owned) and non-secure (i.e. kernel owned).
Some chipsets have the ability to change memory states between secure
& non-secure at page level granularity, and in these cases you don't
need to worry about having a CMA region like this. That is not the
case on the Mediatek chips where there is a limit to how many regions
you can mark as secure. In order to deal with that limitation, once a
secure allocation needs to be performed, the kernel driver allocates
the entire CMA region so nothing else will use it. Then it marks that
whole region secure and the TEE can do its own allocations from that
region. When all those allocations are freed, it can mark that region
as non-secure again, drop the whole CMA allocation and the kernel can
make use of that CMA region again.  (there is the other dma-heap in
their patches, which is for a smaller region that can always be
secure...but that one is a permanent carveout, the CMA region is
available to the kernel while not in use for secure memory)

So maybe something like:

+title:Secure Reserved CMA Region
+
+description:
+  This binding describes a CMA region that can dynamically transition
between secure and non-secure states that a TEE can allocate memory
from.
+
+maintainers:
+  - Yong Wu <yong.wu@mediatek.com>
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: secure_cma_region
+
+required:
+  - compatible
+  - reg
+  - reusable
+
+unevaluatedProperties: false
+
+examples:
+  - |
+
+    reserved-memory {
+        #address-cells =3D <1>;
+        #size-cells =3D <1>;
+        ranges;
+
+        reserved-memory@80000000 {
+            compatible =3D "secure_cma_region";
+            reusable;
+            reg =3D <0x80000000 0x18000000>;
+        };
+    };
--=20


>
> Regarding our special, the new heap driver may be different, and other
> HWs share this reserve buffer and manage it through this pure SW heap.
>
> >  AIUI, it's a requirement from certain content providers for
> > video playback to work. So why the Mediatek specific binding?
> >
> > Rob
